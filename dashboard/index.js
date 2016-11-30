var blessed = require('blessed')
var contrib = require('blessed-contrib')
var exec = require('child_process').exec;
var screen = blessed.screen()

var grid = new contrib.grid({rows: 4, cols: 4, screen: screen})

var map = grid.set(0,0,2,1,blessed.box,{label: 'box1'});
var map2 = grid.set(0,1,2,3,blessed.box,{label: 'box2'});
var line3 = grid.set(2,0,2,2,contrib.line,{label: 'cpu usage',numYLabels: 1});
var line4 = grid.set(2,2,2,2,contrib.line,{label: 'mem usage',numYLabels: 1});

var cpulineData = {
	title: "",
	style: {line: "green"},
	x: [],
	y: []
}
var memLineData = {
	title: "",
	style: {line: "blue"},
	x: [],
	y: [],
}
function refreshLineData(type,data,line){
	if(data.y.length > 500){
		data.y = []
	}
	data.x.push(data.y.length)
	exec("ESC=`printf \"\e\"`; ps -A -o %"+type+" | awk '{s+=$1} END {print \"\" s}'",function(e,s,st){data.y.push(s/8)});
	line.setData(data)
}

setInterval(function(){
	refreshLineData("cpu",cpulineData,line3)
	refreshLineData("mem",memLineData,line4)
	screen.render()
},1000);

screen.render()
screen.key(['escape', 'q', 'C-c'], function(ch, key) {
   return process.exit(0);
});

screen.render()
