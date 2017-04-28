// Key combinations
var mash = ['ctrl', 'alt', 'cmd'];


Window.prototype.toGrid = function(x, y, width, height) {
  var screen = this.screen().frame();

  this.setFrame({
    x: Math.round(x * screen.width)  + screen.x,
    y: Math.round(y * screen.height) + screen.y,
    width:  Math.round(width  * screen.width),
    height: Math.round(height * screen.height),
  });

  return this;
}

Window.prototype.toLeft = function() {
  this.toGrid(0.0, 0.0, 0.5, 1.0);
  return this;
}

Window.prototype.toRight = function() {
  this.toGrid(0.5, 0.0, 0.5, 1.0);
  return this;
}

Window.prototype.toTop = function() {
  this.toGrid(0.0, 0.0, 1.0, 0.5);
  return this;
}

Window.prototype.toBottom = function() {
  this.toGrid(0.0, 0.5, 1.0, 0.5);
  return this;
}

Window.prototype.toCentered45 = function() {
  this.toGrid(0.1, 0.0, 0.8, 1.0);
  return this;
}

Window.prototype.toFullScreen = function() {
  this.toGrid(0.0, 0.0, 1.0, 1.0);
  return this;
}

var previousSizes = {};
Window.prototype.toggleFullscreen = function() {
  if (previousSizes[this]) {
    this.setFrame(previousSizes[this]);
    delete previousSizes[this];
  } else {
    previousSizes[this] = this.frame();
    this.toFullScreen();
  }
  return this;
}

App.prototype.firstWindow = function() {
  return this.mainWindow();
};

function fwindow() {
  return Window.focused();
}

function layoutApp(appTitle, clb) {
  var windowOnScreen = _.result(App.get(appTitle), 'firstWindow');
  if (windowOnScreen) {
    clb.call(windowOnScreen);
  }
}

// Screen placement movement
Key.on('left', mash, function() {
  fwindow().toLeft();
});
Key.on('right', mash, function() {
  fwindow().toRight();
});
Key.on('up', mash, function() {
  fwindow().toTop();
});
Key.on('down', mash, function() {
  fwindow().toBottom();
});
Key.on('.', mash, function() {
  fwindow().toCentered45();
});
Key.on('space', mash, function() {
  fwindow().toggleFullscreen();
});
Key.on('f', ['alt', 'cmd'], function() {
  fwindow().toFullScreen();
});

// layouts
Key.on('1', mash, function() {
  Phoenix.notify('layout: communication');

  layoutApp('Mail', function() {
    this.toGrid(0.0, 0.0, 0.75, 0.75);
  });
  layoutApp('EchofonLite', function() {
    this.toGrid(0.75, 0.0, 0.25, 0.75);
  });
});

Key.on('2', mash, function() {
  Phoenix.notify('layout: work');

  layoutApp('Sublime Text', function() {
    this.toCentered45();
  });
  layoutApp('iTerm', function() {
    this.toBottom();
  });
});
