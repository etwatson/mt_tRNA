library(ape)
dir <- "/media/mcclintock/etw/tRNA_coevol/mt-tRNA/alignments/"
glob <- list.files(path = dir ,pattern = ".dnd")
for(i in 1:length(glob)){
  file <- glob[i]
  dnd <- ape::read.tree(paste(dir,file,sep = "/"))
  length(dnd$tip.label)
  M <-ape::dist.nodes(dnd)[1:length(dnd$tip.label),1:length(dnd$tip.label)]
  rownames(M) <- dnd$tip.label
  colnames(M) <- dnd$tip.label
  print(M)
  print(
  apply(
  M==max(ape::dist.nodes(dnd)[1:length(dnd$tip.label),1:length(dnd$tip.label)]), 1, 
    function(u) paste( names(which(u)), collapse="," ) 
  ))
}
