//var offset;

/**
 * Initializes the global variables and creates <imag> tags for holding the thumbnails
 */
function init() {
  //position strip, container for thumb images and container for cover buttons
  //  note: to masks thumb images strip is on top of them;
  //  cover buttons are on top of strip to get mouse events
  var anchorAt = {left: '0px', top: '0px'};
  jQuery('#strip').css(anchorAt);
  var thumbsDiv = jQuery('#thumbs');
  var coversDiv = jQuery('#covers');
  //create html elements for thumb images and cover buttons, style and position them
  jQuery.each(thumbs, function(i, thumb) {
    jQuery('<img>').addClass('thumb').appendTo (thumbsDiv);
    var aNum = jQuery('<a>').addClass('nums').appendTo (coversDiv);
    aNum.attr('target', '_blank');
  });
}

// Creates and positions all the strip and video thumbs. Initiates upload of YouTube info for all videos.
function makeThumbs () {
/*  offset = jQuery('#strip').offset();
  var xLeft = offset.left;
  var yTop = offset.top;*/
  jQuery.each(thumbs, function(i, thumb) {
    // var x = xLeft + parseInt(thumb.x);
    // var y = yTop + parseInt(thumb.y) - 80;
    var x = parseInt(thumb.x);
    var y = parseInt(thumb.y); // - 80;
    jQuery('img.thumb:eq(' + i + ')').css({left: x + 'px', top: y + 'px'});
    var numButton = jQuery('a.nums:eq(' + i + ')');
    x = x - 2;
    numButton.css({left: x + 'px', top: y + 'px', 'z-index':'3'});
    numButton.html('#' + (i + 1));
  });
  //define hover functionality for cover buttons and start uploading info about videos from YouTube
  //  note: as upload is asynchronous, thumbs and video info is updated separately once the info is obtained
  jQuery.each(thumbArray, function(index, video) {
    var filter = ' :nth-child(' + (index + 1) + ')';
    //hover functionality
    //YouTube info uploading
    var url = 'http://gdata.youtube.com/feeds/api/videos/' + video.ytId + '?v=2&alt=json';
    jQuery.ajax({url: url, dataType: "jsonp", success: function (data) {
	  thumbArray[index].src = update(jQuery('#thumbs' + filter), video, data);
	  updateLink(index);
    }});
  });
}

// Updates thumb images and video info distilled from YouTube data. To be called once data is received.
function update (thumb, video, data) {
  data = data.entry;
  //thumbnail (default)
  var thumbnails = data.media$group.media$thumbnail;
  var thumbnail = thumbnails[0];
  var src = thumbnail.url;
  video.thumb = {url: thumbnail.url, width: thumbnail.width, height: thumbnail.height};
  for (var i = 1; i < thumbnails.length; thumbnail = thumbnails[++i]) {
    if (thumbnail.yt$name == 'default') {
      src = thumbnail.url;
      video.thumb = {url: thumbnail.url, width: thumbnail.width, height: thumbnail.height};
      break;
    }
  }
  //display thumb
  thumb.attr({'src': video.thumb.url, 'width': thumbSize.width, 'height': thumbSize.height});
/*  .load(function() {
    if (! this.complete || typeof this.naturalWidth == "undefined" || this.naturalWidth == 0) {
      //alert('No such thumb: ' + src);
    }
  });*/
  //syndication: prevents us from using this video
  var accesses = data.yt$accessControl;
  //flash: prevents us from using this video on iOS
  if (data.content != null && data.content.type != null) {
	video.isFlash = data.content.type.indexOf('flash') != -1;
  }
  for (var i = 0, access = accesses[i]; i < accesses.length; access = accesses[++i]) {
    if (access.action == 'syndicate') {video.isSyndicated = access.permission != 'allowed';}
  }
  //title
  video.title = data.title.$t;
  //authors
  video.authors = data.author[0].name.$t;
  for (var i = 1; i < data.author.length; i++) {
    video.authors += ', ' + data.author[i].name.$t;
  }
  //categories
  video.categories = new Array();
  for (var i = 0; i < data.category.length; i++) {
    var term = data.category[i].term;
    if (term.indexOf('http://') == -1) {video.categories.push(term);}
  }
  //date published
  var time = data.published.$t.match(/(\d+)-(\d+)-(\d+)T.*/);
  video.published = {year: time[1], month: time[2], day: time[3]};
  //duration, views, rating
  video.duration = data.media$group.yt$duration.seconds;
  video.views = data.yt$statistics.viewCount;
  video.rating = {average: data.gd$rating.average, count: data.gd$rating.numRaters};
  return video.thumb.url;
}