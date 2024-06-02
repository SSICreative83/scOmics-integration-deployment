# scrna_omics_analysis.R
library(Seurat)
library(Signac)

scrna_omics_analysis <- function(file_path) {
    data <- Read10X(data.dir = file_path)
    seurat_object <- CreateSeuratObject(counts = data$`Gene Expression`)
    seurat_object <- NormalizeData(seurat_object)
    seurat_object <- FindVariableFeatures(seurat_object)
    seurat_object <- ScaleData(seurat_object)
    seurat_object <- RunPCA(seurat_object)
    seurat_object <- FindNeighbors(seurat_object, dims = 1:10)
    seurat_object <- FindClusters(seurat_object)
    seurat_object <- RunUMAP(seurat_object, dims = 1:10)
    
    # Integrate ATAC-seq data
    atac_data <- Read10X_h5("atac_data.h5")
    seurat_object[["ATAC"]] <- CreateAssayObject(counts = atac_data)
    seurat_object <- NormalizeData(seurat_object, assay = "ATAC")
    seurat_object <- FindTopFeatures(seurat_object, assay = "ATAC", min.cutoff = 10)
    seurat_object <- RunTFIDF(seurat_object)
    seurat_object <- RunSVD(seurat_object)
    
    print(seurat_object)
}

scrna_omics_analysis("scrna_seq_data/")
