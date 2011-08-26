
//Initializes the up and down buttons and registers mouse events with handlers
function makeArrows() {
  var arrowUp = jQuery('#arrowUp');
  var arrowDown = jQuery('#arrowDown');
  arrowUp.hover(
    function() {
      arrowUp.css('opacity', '0.7');
    },
    function() {
      var display = arrowUp.css('display');
      arrowUp.fadeOut('fast', function() {
        arrowUp.css('opacity', '0.0');
        arrowUp.css('display', display);
      });
    }
  );
  arrowUp.click(function() {
    moveUp()
  });
  arrowDown.hover(
    function() {
      arrowDown.css('opacity', '0.7');
    },
    function() {
      var display = arrowDown.css('display');
      arrowDown.fadeOut('fast', function() {
        arrowDown.css('opacity', '0.0');
        arrowDown.css('display', display);
      });
    }
  );
  arrowDown.click(function() {
    moveDown()
  });
}

function updateLink(index) {
  if (index < thumbs.length) {
  //Sets the image map's url and title (for tooltip)
    var tIndex = (currentIndex + index) % thumbArray.length;
    var video = thumbArray[tIndex];
	
	var parlink = '/video?id=' + video.ytId + '&type=yt';
	
    //var ytLink = 'http://www.youtube.com/watch?v=' + video.ytId;
    var area = jQuery('area:eq(' + index + ')');
    area.attr('href', parlink);//ytLink);
    var text = video.title + ' by ' + video.authors
        + ' (' + video.published.year + '/' + video.published.month + ')';
    //'title' is used as the tooltip in most browsers
    area.attr('title', text);
  //Sets up the number link
    var aNum = jQuery('a.nums:eq(' + index + ')');
    aNum.attr('href', parlink);//ytLink);
    aNum.html('#' + (tIndex + 1));
    aNum.attr('title', text);
  }
}

//Moves the strip of videos up by one slot. This implementation is more complex with only
//9 <img> elements. Images (thumbnails) are swapped in by setting the src of an <img> element.
function moveUp() {
  if (lock) {return;}
  lock = true;
  var thumbs = jQuery('.thumb');
  var prevX, prevY;
  var rollOver = (thumbs.size() + currentIndex) % thumbArray.length;
  thumbs.each(function(index, image) {
    var prev;
    if (index == 0) {
      prevX = jQuery(image).css('left');
      prevY = jQuery(image).css('top');
      prev = jQuery('.thumb:last');
      if (index == top) {
        jQuery(image).css({left: '52px', top: '750px'});
        jQuery(image).attr('src', thumbArray[rollOver].src);
        jQuery(image).animate({left: prev.css('left'), top: prev.css('top')}, speed, function() {
          currentIndex++;
          currentIndex %= thumbArray.length;
          top++;
          top %= thumbs.size();
          for (var i = 0; i < thumbs.size(); i++) {
            updateLink(i);
          }
          lock = false;
        });
      }
      else {
        jQuery(image).animate({left: prev.css('left'), top: prev.css('top')}, speed);
      }
    }
    else {
      var tempX = prevX;
      var tempY = prevY;
      prevX = jQuery(image).css('left');
      prevY = jQuery(image).css('top');
      if (index == top) {
        jQuery(image).css({left: '52px', top: '750px'});
        jQuery(image).attr('src', thumbArray[rollOver].src);
        jQuery(image).animate({left: tempX, top: tempY}, speed, function() {
          currentIndex++;
          currentIndex %= thumbArray.length;
          top++;
          top %= thumbs.size();
          for (var i = 0; i < thumbs.size(); i++) {
            updateLink(i);
          }
          lock = false;
        });
      }
      else {
        jQuery(image).animate({left: tempX, top: tempY}, speed);
      }
    }
  });
}

//Moves the strip of videos down by one slot. This implementation is more complex with only
//9 <img> elements. Images (thumbnails) are swapped in by setting the src of an <img> element.
function moveDown() {
  if (lock) {return;}
  lock = true;
  var thumbs = jQuery('.thumb');
  var tSize = thumbs.size();
  var firstX, firstY;
  var prev = (top - 1 + tSize) % tSize;
  var rollOver = (currentIndex - 1 + thumbArray.length) % thumbArray.length;
  thumbs.each(function(index, image) {
    if (index == (thumbs.size() - 1)) {
	  if (index == prev) {
		jQuery(image).css({left: '78px', top: '-40px'});
	    jQuery('.thumb:eq(' + prev + ')').attr('src', thumbArray[rollOver].src);
		jQuery(image).animate({left: firstX, top: firstY}, speed, function() {
		  currentIndex--;
          currentIndex = (currentIndex + thumbArray.length) % thumbArray.length;
          top--;
          top = (top + tSize) % tSize;
		  for (var i = 0; i < thumbs.size(); i++) {
			updateLink(i);
		  }
		  lock = false;
	    });
	  }
	  else {
		jQuery(image).animate({left: firstX, top: firstY}, speed);
	  }
    }
    else {
      if (index == 0) {
        firstX = jQuery(image).css('left');
        firstY = jQuery(image).css('top');
      }
      var next = jQuery('.thumb:eq(' + (index + 1) + ')');
	  if (index == prev) {
		jQuery(image).css({left: '78px', top: '-40px'});
	    jQuery('.thumb:eq(' + prev + ')').attr('src', thumbArray[rollOver].src);
		jQuery(image).animate({left: next.css('left'), top: next.css('top')}, speed, function() {
		  currentIndex--;
          currentIndex = (currentIndex + thumbArray.length) % thumbArray.length;
          top--;
          top = (top + tSize) % tSize;
		  for (var i = 0; i < thumbs.size(); i++) {
			updateLink(i);
		  }
		  lock = false;
	    });
	  }
	  else {
        jQuery(image).animate({left: next.css('left'), top: next.css('top')}, speed);
	  }
    }
  });
}