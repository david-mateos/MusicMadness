library(dplyr)
library(graphics)

setwd("/Users/your_dir_here")
source("drawBracketLines.R") # file must be in wd

all_tracks <- read.csv("bracket_tracks.csv", header = F, stringsAsFactors = F)
names(all_tracks) <- c("track", "popularity", "artist")

n = 32; q = 4 # for artists with not enough tracks for a 64 track bracket
key_words <- c("Recorded", "Version", "Remix", "Mix", "- Live")
#to_remove <- " - Remastered 2009" # take out a part of a string

competitive <- all_tracks %>%
                  mutate(track = as.character(track)) %>%
                  filter(!grepl(paste(key_words, collapse="|"), track)) %>%
                  arrange(-popularity) %>%
                  slice(1:n) %>%
                  mutate(rank = row_number(desc(popularity))) #%>%
                #mutate(track= str_remove(track, to_remove))

a <- seq(1,n, q)
b <- rev(seq(4,n, q))
c <- seq(3,n, q)
d <- rev(seq(2,n, q))
A <- c(rbind(a, b))
B <- c(rbind(c, d))

A1 <- A[1:(length(A)/2)]
A2 <- A[((length(A)/2)+1):length(A)]
B1 <- B[1:(length(B)/2)]
B2 <- B[((length(B)/2)+1):length(B)]

seeds <- c(A1,B1,A2,B2)
competitive <- competitive[match(seeds, competitive$rank),] # order by exact seed pos.

ordered_tracks_TOPLEFT <- competitive$track[1:(n/q)]
ordered_tracks_BOTLEFT <- competitive$track[((n/q)+1):(n/2)]
ordered_tracks_TOPRIGHT <- competitive$track[((n/2)+1):((n/q)*3)]
ordered_tracks_BOTRIGHT <- competitive$track[(((n/q)*3)+1):n]

artists <- data.frame(table(competitive$artist))
artist <- as.character(artists[order(-artists$Freq),]$Var1[1])


# Draw and Populate the bracket
pdf(paste(artist, "_bracket.pdf", sep=""), width = 28, height = 18)  # save and download as this
drawBracket(n) 
for (i in 1:(n/q)){
  # Left Side
  text(15,68-(i*4), ordered_tracks_TOPLEFT[i], cex=1.33, adj = 0)
  text(15,34-(i*4), ordered_tracks_BOTLEFT[i], cex=1.33, adj = 0)
  # Right Side
  text(205,68-(i*4), ordered_tracks_TOPRIGHT[i], cex=1.33, adj = 1)
  text(205,34-(i*4), ordered_tracks_BOTRIGHT[i], cex=1.33, adj = 1)
  # Title
  text(110, 66, paste(artist, "Madness", ssep = " "), cex = 2)
}
dev.off()
