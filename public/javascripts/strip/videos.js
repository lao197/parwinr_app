//Video objects with YouTube IDs; 
//These objects are enhanced from Google API via AJAX/HTTP GET requests with fields:
//  'title' of the video,
//  'etc. (later)

//thumbArray size must be >= 9 (the number of video slots on the strip)
//thumbArray is an array contains all videos
//An video contains the attributes of a YouTube video. More importantly:
//  thumbArray[...].ytId    is YoutTube's video ID
//  thumbArray[...].src     is the url or file path of the thumbnail image
var thumbArray;
var currentIndex = 0;
var speed = 200;

//To prevent multiple button clicks before animations are finished
var lock = false;
//var domImages;

var top = 0;

function start() {
  init();
  
  var x = readIndex();
  var rand = 0;
  if (x) {
    rand = parseInt(x);
  }
  else {
    rand = Math.floor(Math.random() * 6);
    storeIndex(rand);
  }
  loadVideosByIndex(rand);
  //getTopVideos('top_rated');
  //testWithoutInternet();
  makeArrows();
}

// Initializes software once the page's DOM is loaded.
jQuery(document).ready(function() {
  start();
});

//Loads a video when the user click on a thumbnail. This is to be implemented in the future
function loadVideo(index) {
  //alert(thumbArray[(currentIndex + index) % thumbArray.length].src);
}

//Loads new videos when the user selected a different list from the drop down box.
function loadVideos(form) {
  var index = form.type.selectedIndex;
  loadVideosByIndex(index);
}

function loadVideosByIndex(index) {
  storeIndex(index);
  jQuery('#selectVideo').attr('selectedIndex', index);
  var opt = jQuery('option:eq(' + index + ')').attr('value');
  getTopVideos(opt);
}

/**
 * Gets an array of videos from Youtube's standard feed and stores it in thumbArray
 */
function getTopVideos(videoType) {
  thumbArray = new Array();
  currentIndex = 0;
  top = 0;
  var url = 'https://gdata.youtube.com/feeds/api/standardfeeds/' + videoType + '?v=2&alt=json';
  //Retrieves the 25 top videos from YouTube and build thumbArray
  jQuery.ajax({url: url, dataType: 'jsonp',
    success: function (data) {
      var entries = data.feed.entry;
      if (entries == null) {
        alert("Cannot retrieve video entries");
      }
      else {
        for (var i = 0; i < entries.length; i++) {
          var id = entries[i].id.$t;
          id = id.substring(id.lastIndexOf(':') + 1, id.length);
          thumbArray[i] = new Object();
          thumbArray[i].ytId = id;
        }
        makeThumbs();
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert('error textStatus=' + textStatus);
    }
  });
  return thumbArray;
}


//For testing without internet only
function testWithoutInternet() {
  //position strip, container for thumb images and container for cover buttons
  //  note: to masks thumb images strip is on top of them;
  //  cover buttons are on top of strip to get mouse events
  thumbArray = new Array();
  for (var i = 0; i < 14; i++) {
    thumbArray[i] = {'src':'image/' + (i + 1) + '.png'};
  }
  var anchorAt = {left: '0px', top: '30px'};
  jQuery('#strip').css(anchorAt);
  var thumbsDiv = jQuery('#thumbs');
  var coversDiv = jQuery('#covers');
  thumbsDiv.css(anchorAt);
  coversDiv.css(anchorAt);
  //create html elements for thumb images and cover buttons, style and position them
  jQuery.each(thumbs, function(i, thumb) {
    jQuery('<img>').addClass('thumb').css({left: thumb.x + 'px', top: (thumb.y - 4) + 'px'}).appendTo (thumbsDiv);
    //jQuery('<button>').addClass('cover').css({left: thumb.x + 'px', top: thumb.y + 'px'}).appendTo (coversDiv);
  });
  //define hover functionality for cover buttons and start uploading info about videos from YouTube
  //  note: as upload is asynchronous, thumbs and video info is updated separately once the info is obtained
  
  jQuery.each(thumbArray, function(index, video) {
    var filter = ' :nth-child(' + (index + 1) + ')';
    var myV = jQuery('#thumbs' + filter);
    myV.attr('src', video.src);
    myV.attr('width', thumbSize.width);
    myV.attr('height', thumbSize.height);
    //hover functionality
    /*var cover = jQuery('#covers' + filter);
    cover.hover(function(){tip.show(cover.offset(), video);},function(){tip.hide()});
    //YouTube info uploading
    var url = 'http://gdata.youtube.com/feeds/api/videos/' + video.ytId + '?v=2&alt=json';
    jQuery.ajax({url: url, dataType: "jsonp", success: function (data) {
      update (jQuery('#thumbs' + filter), video, data);
    }});*/
  });
}

function storeIndex(index) {
  createCookie('index', index, 3);
}

function readIndex() {
  return readCookie('index');
}

/**
 * Cookie functions from:
 * http://www.quirksmode.org/js/cookies.html
 */
 
function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}
