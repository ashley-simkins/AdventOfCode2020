## Code for 2020 Advent of Code

####### Day 1 ##########


## Puzzle 1


input1 <- read.delim("Day1_input.txt", header = F)


for (a in 1:nrow(input1)){

  if (a < nrow(input1)){
    b <- a + 1
  }
  
  for (c in b:nrow(input1)){
    if (input1$V1[a] + input1$V1[c] == 2020){
      print(input1$V1[a]*input1$V1[c])
    }
  }
}


## Puzzle 2

input1 <- read.delim("Day1_input.txt", header = F)


for (a in 1:nrow(input1)){

  if (a < nrow(input1)){
    z <- a + 1
  }
  
  for (b in z:nrow(input1)){
    
    if (z < nrow(input1)){
      y <- z + 1
    }
    
    for (c in y:nrow(input1)){
    
      if (input1$V1[a] + input1$V1[b] + input1$V1[c] == 2020){
        print(input1$V1[a]*input1$V1[b]*input1$V1[c])
      }
    }
  }
}


####### Day 2 ##########

input2 <- read.delim("Day2_input.txt", header = F)
input2$V1 <- as.character(input2$V1)

library(tidyverse)
input2s <- data.frame(do.call('rbind', str_split(input2$V1, "[- :]", 4)))

input2s$X1 <- as.integer(input2s$X3)
input2s$X2<- as.integer(input2s$X4)
input2s$X3 <- as.character(input2s$X3)
input2s$X4 <- as.character(input2s$X4)

                      
#input2s$valid[grep(input2s$X3, input2s$X4)] <- T

for (p in 1:nrow(input2s)){
  if (!grepl(input2s$X3[p], input2s$X4[p])){
    input2s$count[p] <- 0
    input2s$valid[p] <- F
  }
  if (grepl(input2s$X3[p], input2s$X4[p])){
    letter_count <- str_count(input2s$X4[p], input2s$X3[p])
    input2s$count[p] <- letter_count
    
    if (letter_count >= input2s$X1[p] && letter_count <= input2s$X2[p]){
      input2s$valid[p] <- T
    }
    else if (letter_count < input2s$X1[p] | letter_count > input2s$X2[p]){
      input2s$valid[p] <- F
    }
  }
}

nrow(input2s[input2s$valid == T,])
test <- input2s[input2s$valid == T,]

