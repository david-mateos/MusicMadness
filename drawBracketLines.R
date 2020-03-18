drawBracket <- function(n){
  x <- seq(0,220,(221/67))
  y <- 0:66
  if (n==64){
    graphics::plot(x,y,type="l", col.axis="white", col.lab="white", bty="n",axes=F, col="white")
    graphics::segments(0,c(seq(0,30,2),seq(34,64,2)),20,c(seq(0,30,2),seq(34,64,2)))
    graphics::segments(20,c(seq(0,28,4),seq(34,62,4)),20,c(seq(2,30,4),seq(36,64,4)))
    graphics::segments(20,c(seq(1,29,4),seq(35,63,4)),40,c(seq(1,29,4),seq(35,63,4)))
    graphics::segments(40,c(seq(1,25,8),seq(35,59,8)),40,c(seq(5,29,8),seq(39,63,8)))
    graphics::segments(40,c(3,11,19,27,37,45,53,61),60,c(3,11,19,27,37,45,53,61))
    graphics::segments(60,c(3,19,37,53),60,c(11,27,45,61))
    graphics::segments(60,c(7,23,41,57),80,c(7,23,41,57))
    graphics::segments(80,c(7,41),80,c(23,57))
    graphics::segments(80,c(15,49),100,c(15,49))
    graphics::segments(100,c(27,37),120,c(27,37))
    graphics::segments(200,c(seq(0,30,2),seq(34,64,2)),220,c(seq(0,30,2),seq(34,64,2)))
    graphics::segments(200,c(seq(0,28,4),seq(34,62,4)),200,c(seq(2,30,4),seq(36,64,4)))
    graphics::segments(180,c(seq(1,29,4),seq(35,63,4)),200,c(seq(1,29,4),seq(35,63,4)))
    graphics::segments(180,c(seq(1,25,8),seq(35,59,8)),180,c(seq(5,29,8),seq(39,63,8)))
    graphics::segments(160,c(3,11,19,27,37,45,53,61),180,c(3,11,19,27,37,45,53,61))
    graphics::segments(160,c(3,19,37,53),160,c(11,27,45,61))
    graphics::segments(140,c(7,23,41,57),160,c(7,23,41,57))
    graphics::segments(140,c(7,41),140,c(23,57))
    graphics::segments(120,c(15,49),140,c(15,49))
  }
  else if (n==32){
    graphics::plot(x,y,type="l", col.axis="white", col.lab="white", bty="n",axes=F, col="white")
    graphics::segments(15,c(seq(1,29,4),seq(35,63,4)),40,c(seq(1,29,4),seq(35,63,4)))
    graphics::segments(40,c(seq(1,25,8),seq(35,59,8)),40,c(seq(5,29,8),seq(39,63,8)))
    graphics::segments(40,c(3,11,19,27,37,45,53,61),60,c(3,11,19,27,37,45,53,61))
    graphics::segments(60,c(3,19,37,53),60,c(11,27,45,61))
    graphics::segments(60,c(7,23,41,57),80,c(7,23,41,57))
    graphics::segments(80,c(7,41),80,c(23,57))
    graphics::segments(80,c(15,49),100,c(15,49))
    graphics::segments(100,c(27,37),120,c(27,37))
    graphics::segments(180,c(seq(1,29,4),seq(35,63,4)),205,c(seq(1,29,4),seq(35,63,4)))
    graphics::segments(180,c(seq(1,25,8),seq(35,59,8)),180,c(seq(5,29,8),seq(39,63,8)))
    graphics::segments(160,c(3,11,19,27,37,45,53,61),180,c(3,11,19,27,37,45,53,61))
    graphics::segments(160,c(3,19,37,53),160,c(11,27,45,61))
    graphics::segments(140,c(7,23,41,57),160,c(7,23,41,57))
    graphics::segments(140,c(7,41),140,c(23,57))
    graphics::segments(120,c(15,49),140,c(15,49))
  }
  else {
    print("n must be either 32 or 64")
  }
}