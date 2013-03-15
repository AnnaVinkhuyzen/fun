## This script is for making a PLINK ped file by taking an existing pedfile
## and randomly selecting one individual per family.

data <- read.table("controls_pedigree.ped",header=F)

u <- unique(data[,1])

plinkout <- numeric(length(u))

for (i in 1:length(u))
#i = 1
{

m <- which(data[,1] == u[i])

#max <- which.max(abs(data[m,6]))

random <- sample(1:length(m),1)


plinkout[i] <- m[random]

}

output <- data[plinkout,]

write.table(output,"controlsoneperfamily.ped",quote=F,row.names=F,col.names=F)