// Copyright 2006-2007 javascript-array.com

var timeout	= 200;
var closeTimer	= 0;
var ddmenuitem	= 0;

// open hidden layer
function mOpen(id)
{	
  // cancel close timer
  mCancelCloseTime();

  // close old layer
  if (ddmenuitem) 
    ddmenuitem.style.visibility = 'hidden';

  // get new layer and show it
  ddmenuitem = document.getElementById(id);
  ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mClose() {
  if (ddmenuitem) {
    ddmenuitem.style.visibility = 'hidden';
  }
}

// go close timer
function mCloseTime() {
  closeTimer = window.setTimeout(mClose, timeout);
}

// cancel close timer
function mCancelCloseTime() {
  if(closeTimer) {
    window.clearTimeout(closeTimer);
    closeTimer = null;
  }
}

// close layer when click-out
document.onclick = mClose; 
