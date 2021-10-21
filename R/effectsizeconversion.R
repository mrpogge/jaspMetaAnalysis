#
# Copyright (C) 2018 University of Amsterdam
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

#main
EffectSizeConversion <- function(jaspResults, dataset, options) {
  
  effectSizeMeasures <- c(options$fisherZs, options$cohenDs, options$corrs, options$logORs)
  variabilityMeasures <- c(options$SdError, options$Var, options$Ssize, options$TZstat)

  ready <- any(effectSizeMeasures != "") & any(variabilityMeasures != "")

  if(ready){
    dataset = .escReadDataset(dataset, options)

    .escCheckErrors(dataset, options)

    .escMainTable(jaspResults, dataset, options)
  }


}

.escReadDataset <- function(dataset, options) {

  if(!is.null(dataset))
    return(dataset)
  else
    return(readDataSetToEnd(columns.as.numeric = c(options$studyName
                                                   options$fisherZs, 
                                                   options$cohenDs,
                                                   options$corrs, 
                                                   options$logORs, 
                                                   options$SdError,
                                                   options$Var,
                                                   options$Ssize, 
                                                   options$TZstat,
                                                   unlist(options$inputCI))))

}

.escCheckErrors <- function(dataset, options) {

  NULL

}

.escMainTable <- function(jaspResults, dataset, options, ready) {

  mainTable <- createJaspTable("Effect Size Conversion Results")
  mainTable$dependOn <- c("fisherZs", 
                          "cohenDs",
                          "corrs", 
                          "logORs", 
                          "SdError",
                          "Var",
                          "Ssize", 
                          "TZstat",
                          "EffectSizeType")
  mainTable$addCitation("Bartoš, Maier (2020). RoBMA (Version 2.0.0) [Computer software].")

  #columns
  mainTable$addColumnInfo(name = "convertedY", title = "Converted Effect Size", type = "number")
  mainTable$addColumnInfo(name = "convertedSE", title = "Converted Standard Error", type = "number")

  if (options$studyName != "") 
    mainTable$addColumnInfo(name = "studyNames", title = "Study names", type = "string")
  
  mainTable$showSpecifiedColumnsOnly <- TRUE
  
  if (ready)
    mainTable$setExpectedSize(length(options$studyName))

  jaspResults[["mainTable"]] <- mainTable

  if (!ready)
    return()

  .escFillMainTable(mainTable, dataset, options)
  
  return()

}
c(options$studyName
                                                   options$fisherZs, 
                                                   options$cohenDs,
                                                   options$corrs, 
                                                   options$logORs, 
                                                   options$SdError,
                                                   options$Var,
                                                   options$Ssize, 
                                                   options$TZstat,
                                                   unlist(options$inputCI)

.escFillMainTable <- function(mainTable, dataset, options, ready) {

  conversionResults <- RoBMA::combine_data(d =     dataset[, encodeColNames(options$fisherZs)    ],
+                                          r =     dataset[, encodeColNames(options$cohenDs)     ],
+                                          z =     dataset[, encodeColNames(options$corrs)       ],
+                                          logOR = dataset[, encodeColNames(options$logORs)      ],
+                                          se =    dataset[, encodeColNames(options$SdError)     ],
+                                          v =     dataset[, encodeColNames(options$Var)         ],
+                                          n =     dataset[, encodeColNames(options$Ssize)       ],
+                                          t =     dataset[, encodeColNames(options$TZstat)      ],
+                                          lCI =   dataset[, encodeColNames(options$inputCI[[1]])],
+                                          uCI =   dataset[, encodeColNames(options$inputCI[[2]])],
                                           transformation = options$EffectSizeType)
  
  mainTable$setData(conversionResults)

  .escSaveNewColumn(conversionResults[,1])
  .escSaveNewColumn(conversionResults[,2])
  

#save

}


.escSaveNewColumn <- function(results) {

  NULL

}