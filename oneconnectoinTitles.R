library(rjson)
set.seed(12345)
par(mar = c(1, 1, 1, 1))
json_file <- ("/Users/gagan/dev/linkedin-graph/allData.json")
json_data <- fromJSON(paste(readLines(json_file),collapse =""))
factors = factor(json_data$titles)
colors = 1:7
circos.trackPlotRegion(ylim = c(0,1), factors = factors, bg.border = NA,
+ panel.fun = function(x,y){xlim = get.cell.meta.data("xlim")
+                           current.sector.index = get.cell.meta.data("sector.index")
+                            circos.text(mean(xlim),0.75,labels = current.sector.index, direction = "arc")
+                             i = get.cell.meta.data("sector.numeric.index")
+                              circos.rect(min(xlim),0,max(xlim),0.25,col=colors[1])})
for(n in seq(1,length(json_data$titles),1)){
+ circos.link(json_data$titles[n],c(0,1), json_data$titles[(n+1)],c(6,7), border = "black")}
