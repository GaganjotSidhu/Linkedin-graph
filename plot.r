set.seed(12345)
par(mar = c(1, 1, 1, 1))
factors = c("BSEE", "MBA", "Engineer", "Scientist", "Manager", "Director", "Director", "Sr. Director")
colors = 1:7


circos.initialize(factors = factors, xlim = c(0, 25))
#circos.par(track.margin = c(0.1, 0))

circos.trackPlotRegion(ylim = c(0, 1), factors = factors, bg.border = NA,
                       panel.fun = function(x, y) {
                         xlim = get.cell.meta.data("xlim")
                         current.sector.index = get.cell.meta.data("sector.index")
                         circos.text(mean(xlim), 0.75, labels = current.sector.index,
                                     direction = "arc")
                         i = get.cell.meta.data("sector.numeric.index")
                         circos.rect(min(xlim), 0, max(xlim), 0.25, col = colors[i])
                       })
circos.link("BSEE", c(0, 1), "Engineer", c(6, 7), border = "black")
circos.link("Engineer", c(0, 1), "Scientist", c(6, 7), border = "black")
circos.link("Scientist", c(0, 1), "Manager", c(6, 7), border = "black")
circos.link("Manager", c(0, 1), "Director", c(9,10), border = "black")
circos.link("Director", c(0, 1), "Director", c(9, 10), border = "black")
circos.link("Director", c(0, 1), "MBA", c(6, 7), border = "black")
circos.link("MBA", c(0, 1), "Sr. Director", c(6, 7), border = "black")



# the following codes calculate the position for the 'little rectangle'


d1 = circlize(6, cell.ylim[1], "Engineer")
theta1 = d1[1, 1]
rou1 = d1[1, 2]
d2 = circlize(7, cell.ylim[1], "Engineer")
theta2 = d2[1, 1]
rou2 = d2[1, 2] - circos.par("track.margin")[1]
# draw the 'little rectangle'
draw.sector(start.degree = theta1, end.degree = theta2, rou1 = rou1,
            rou2 = rou2, col = "red", border = "red")

d1 = circlize(6, cell.ylim[1], "Scientist")
theta1 = d1[1, 1]
rou1 = d1[1, 2]
d2 = circlize(7, cell.ylim[1], "Scientist")
theta2 = d2[1, 1]
rou2 = d2[1, 2] - circos.par("track.margin")[1]
# draw the 'little rectangle'
draw.sector(start.degree = theta1, end.degree = theta2, rou1 = rou1,
            rou2 = rou2, col = "red", border = "red")

d1 = circlize(6, cell.ylim[1], "Manager")
theta1 = d1[1, 1]
rou1 = d1[1, 2]
d2 = circlize(7, cell.ylim[1], "Manager")
theta2 = d2[1, 1]
rou2 = d2[1, 2] - circos.par("track.margin")[1]
# draw the 'little rectangle'
draw.sector(start.degree = theta1, end.degree = theta2, rou1 = rou1,
            rou2 = rou2, col = "red", border = "red")

d1 = circlize(9, cell.ylim[1], "Director")
theta1 = d1[1, 1]
rou1 = d1[1, 2]
d2 = circlize(10, cell.ylim[1], "Director")
theta2 = d2[1, 1]
rou2 = d2[1, 2] - circos.par("track.margin")[1]
# draw the 'little rectangle'
draw.sector(start.degree = theta1, end.degree = theta2, rou1 = rou1,
            rou2 = rou2, col = "red", border = "red")

d1 = circlize(6, cell.ylim[1], "MBA")
theta1 = d1[1, 1]
rou1 = d1[1, 2]
d2 = circlize(7, cell.ylim[1], "MBA")
theta2 = d2[1, 1]
rou2 = d2[1, 2] - circos.par("track.margin")[1]
# draw the 'little rectangle'
draw.sector(start.degree = theta1, end.degree = theta2, rou1 = rou1,
            rou2 = rou2, col = "red", border = "red")

d1 = circlize(6, cell.ylim[1], "Sr. Director")
theta1 = d1[1, 1]
rou1 = d1[1, 2]
d2 = circlize(7, cell.ylim[1], "Sr. Director")
theta2 = d2[1, 1]
rou2 = d2[1, 2] - circos.par("track.margin")[1]
# draw the 'little rectangle'
draw.sector(start.degree = theta1, end.degree = theta2, rou1 = rou1,
            rou2 = 1.0*rou2, col = "red", border = "red")


circos.clear()

