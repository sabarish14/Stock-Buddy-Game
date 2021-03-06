<!DOCTYPE html>
<html>
<head>
	<title>Graph</title>
	
</head>
<body>



<div class="container web">
	<div class="row">
		<div class="span12">
			<div class="hero-unit">
				
			</div>
		</div>
	</div>
	<div class="row content">
		<div class="span12">
			
			<div id="chartDemoContainer" style="height: 500px; min-width: 500px; margin-bottom: 30px;"></div>
		</div>
	</div>
</div>



<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript" src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//code.highcharts.com/stock/highstock.js"></script>

<script type="text/javascript">
/**
* Version 2.0
*/
var Markit = {};
/**
* Define the InteractiveChartApi.
* First argument is symbol (string) for the quote. Examples: AAPL, MSFT, JNJ, GOOG.
* Second argument is duration (int) for how many days of history to retrieve.
*/
Markit.InteractiveChartApi = function(symbol,duration){
this.symbol = symbol.toUpperCase();
this.duration = duration;
this.PlotChart();
};
Markit.InteractiveChartApi.prototype.PlotChart = function(){
var params = {
parameters: JSON.stringify( this.getInputParams() )
}
//Make JSON request for timeseries data
$.ajax({
beforeSend:function(){
$("#chartDemoContainer").text("Loading chart...");
},
data: params,
url: "http://dev.markitondemand.com/Api/v2/InteractiveChart/jsonp",
dataType: "jsonp",
context: this,
success: function(json){
//Catch errors
if (!json || json.Message){
console.error("Error: ", json.Message);
return;
}
this.render(json);
},
error: function(response,txtStatus){
console.log(response,txtStatus)
}
});
};
Markit.InteractiveChartApi.prototype.getInputParams = function(){
return {
Normalized: false,
NumberOfDays: this.duration,
DataPeriod: "Day",
Elements: [
{
Symbol: this.symbol,
Type: "price",
Params: ["ohlc"] //ohlc, c = close only
},
{
Symbol: this.symbol,
Type: "volume"
}
]
//,LabelPeriod: 'Week',
//LabelInterval: 1
}
};
Markit.InteractiveChartApi.prototype._fixDate = function(dateIn) {
var dat = new Date(dateIn);
return Date.UTC(dat.getFullYear(), dat.getMonth(), dat.getDate());
};
Markit.InteractiveChartApi.prototype._getOHLC = function(json) {
var dates = json.Dates || [];
var elements = json.Elements || [];
var chartSeries = [];
if (elements[0]){
for (var i = 0, datLen = dates.length; i < datLen; i++) {
var dat = this._fixDate( dates[i] );
var pointData = [
dat,
elements[0].DataSeries['open'].values[i],
elements[0].DataSeries['high'].values[i],
elements[0].DataSeries['low'].values[i],
elements[0].DataSeries['close'].values[i]
];
chartSeries.push( pointData );
};
}
return chartSeries;
};
Markit.InteractiveChartApi.prototype._getVolume = function(json) {
var dates = json.Dates || [];
var elements = json.Elements || [];
var chartSeries = [];
if (elements[1]){
for (var i = 0, datLen = dates.length; i < datLen; i++) {
var dat = this._fixDate( dates[i] );
var pointData = [
dat,
elements[1].DataSeries['volume'].values[i]
];
chartSeries.push( pointData );
};
}
return chartSeries;
};
Markit.InteractiveChartApi.prototype.render = function(data) {
//console.log(data)
// split the data set into ohlc and volume
var ohlc = this._getOHLC(data),
volume = this._getVolume(data);
// set the allowed units for data grouping
var groupingUnits = [[
'week', // unit name
[1] // allowed multiples
], [
'month',
[1, 2, 3, 4, 6]
]];
// create the chart
$('#chartDemoContainer').highcharts('StockChart', {
rangeSelector: {
selected: 1
//enabled: false
},
title: {
text: this.symbol + ' Historical Price'
},
yAxis: [{
title: {
text: 'OHLC'
},
height: 200,
lineWidth: 2
}, {
title: {
text: 'Volume'
},
top: 300,
height: 100,
offset: 0,
lineWidth: 2
}],
series: [{
type: 'candlestick',
name: this.symbol,
data: ohlc,
dataGrouping: {
units: groupingUnits
}
}, {
type: 'column',
name: 'Volume',
data: volume,
yAxis: 1,
dataGrouping: {
units: groupingUnits
}
}],
credits: {
enabled:false
}
});
};
</script>
<script type="text/javascript">

	$(function(){
		
		var sym ="<%=request.getParameter("param1")%>";
		var dur =  3650;
		
		new Markit.InteractiveChartApi(sym, dur);
	});

</script>
</body>
 
</html>