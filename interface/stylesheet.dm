/client/script = {"<style>
body					{font-family: Verdana, sans-serif;}

h1, h2, h3, h4, h5, h6	{color: #0000ff;	font-family: Georgia, Verdana, sans-serif;}

em						{font-style: normal;	font-weight: bold;}

.motd					{color: #638500;	font-family: Verdana, sans-serif;}
.motd h1, .motd h2, .motd h3, .motd h4, .motd h5, .motd h6
	{color: #638500;	text-decoration: underline;}
.motd a, .motd a:link, .motd a:visited, .motd a:active, .motd a:hover
	{color: #638500;}

.italics				{					font-style: italic;}

.prefix					{					font-weight: bold;}

.ooc					{					font-weight: bold;}
.adminobserverooc		{color: #0099cc;	font-weight: bold;}
.adminooc				{color: #700038;	font-weight: bold;}

.adminobserver			{color: #996600;	font-weight: bold;}
.admin					{color: #386aff;	font-weight: bold;}

.name					{					font-weight: bold;}

.say					{}
.deadsay				{color: #5c00e6;}
.radio					{color: #008000;}
.sciradio				{color: #993399;}
.comradio				{color: #aca82d;}
.secradio				{color: #b22222;}
.medradio				{color: #337296;}
.engradio				{color: #fb5613;}
.suppradio				{color: #a8732b;}
.servradio				{color: #6eaa2c;}
.syndradio				{color: #6d3f40;}
.centcomradio			{color: #686868;}
.aiprivradio			{color: #ff00ff;}

.yell					{					font-weight: bold;}

.alert					{color: #ff0000;}
h1.alert, h2.alert		{color: #000000;}

.emote					{					font-style: italic;}
.selecteddna			{color: #ffffff; 	background-color: #001B1B}

.attack					{color: #ff0000;}
.disarm					{color: #990000;}
.passive				{color: #660000;}

.userdanger				{color: #ff0000;	font-weight: bold; font-size: 3;}
.danger					{color: #ff0000;}
.warning				{color: #ff0000;	font-style: italic;}
.announce 				{color: #228b22;	font-weight: bold;}
.boldannounce			{color: #ff0000;	font-weight: bold;}
.greenannounce			{color: #00ff00;	font-weight: bold;}
.rose					{color: #ff5050;}
.info					{color: #0000CC;}
.notice					{color: #000099;}
.boldnotice				{color: #000099;	font-weight: bold;}
.adminnotice			{color: #0000ff;}
.unconscious			{color: #0000ff;	font-weight: bold;}
.suicide				{color: #ff5050;	font-style: italic;}
.green					{color: #03ff39;}
.shadowling				{color: #3b2769;}
.cult					{color: #960000;}
.cultitalic				{color: #960000;	font-style: italic;}
.cultlarge				{color: #960000; font-weight: bold; font-size: 3;}
.narsie					{color: #960000; font-weight: bold; font-size: 15;}
.purple					{color: #5e2d79;}

.revennotice			{color: #1d2953;}
.revenboldnotice		{color: #1d2953;	font-weight: bold;}
.revenbignotice			{color: #1d2953;	font-weight: bold; font-size: 3;}
.revenminor				{color: #823abb}
.revenwarning			{color: #760fbb;	font-style: italic;}
.revendanger			{color: #760fbb;	font-weight: bold; font-size: 3;}

.newscaster				{color: #800000;}
.ghostalert				{color: #5c00e6;	font-style: italic; font-weight: bold;}

.alien					{color: #543354;}
.noticealien			{color: #00c000;}
.alertalien				{color: #00c000;	font-weight: bold;}

.interface				{color: #330033;}

.sans					{font-family: "Comic Sans MS", cursive, sans-serif;}
.papyrus				{font-family: "Papyrus", cursive, sans-serif;}
.robot					{font-family: "Courier New", cursive, sans-serif;}

.commmand_headset       {font-weight: bold; font-size: 3;}
.big					{font-size: 3;}
.reallybig				{font-size: 4;}
.greentext				{color: #00FF00;	font-size: 3;}
.redtext				{color: #FF0000;	font-size: 3;}

BIG IMG.icon 			{width: 32px; height: 32px;}

.memo					{color: #638500;	text-align: center;}
.memoedit				{text-align: center;	font-size: 2;}
</style>"}

/*
.alias {cursor: alias;}
.all-scroll {cursor: url('html/cursors/sizeall.ani');}
.auto {cursor: auto;}
.cell {cursor: url('html/cursors/help.ani');}
.context-menu {cursor: url('html/cursors/help.ani');}
.col-resize {cursor: url('html/cursors/col-resize.ani');}
.copy {cursor: url('html/cursors/arrow.ani');}
.crosshair {cursor: url('html/cursors/cross.ani');}
.default {cursor: url('html/cursors/arrow.ani');}
.e-resize {cursor: url('html/cursors/col-resize.ani');}
.ew-resize {cursor: url('html/cursors/col-resize.ani');}
.help {cursor: url('html/cursors/help.ani');}
.move {cursor: url('html/cursors/move.ani');}
.n-resize {cursor: url('html/cursors/sizens.ani');}
.ne-resize {cursor: url('html/cursors/sizenesw.ani');}
.nesw-resize {cursor: url('html/cursors/sizenesw.ani');}
.ns-resize {cursor: url('html/cursors/sizens.ani');}
.nw-resize {cursor: url('html/cursors/sizenwse.ani');}
.nwse-resize {cursor: url('html/cursors/sizenwse.ani');}
.no-drop {cursor: url('html/cursors/no.ani');}
.none {cursor: none;}
.not-allowed {cursor: url('html/cursors/no.ani');}
.pointer {cursor: url('html/cursors/appstarting.ani');}
.progress {cursor: url('html/cursors/busy.ani');}
.row-resize {cursor: url('html/cursors/sizens.ani');}
.s-resize {cursor: url('html/cursors/sizens.ani');}
.se-resize {cursor: url('html/cursors/sizenwse.ani');}
.sw-resize {cursor: url('html/cursors/sizenesw.ani');}
.text {cursor: url('html/cursors/ibeam.ani');}
.url {cursor: url('html/cursors/arrow.ani');}
.w-resize {cursor: url('html/cursors/col-resize.ani');}
.wait {cursor: url('html/cursors/busy.ani');}
.zoom-in {cursor: zoom-in;}
.zoom-out {cursor: zoom-out;}
*/