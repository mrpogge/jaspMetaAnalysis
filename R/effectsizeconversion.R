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
  
  .showOptions(jaspResults, options)
  dataset <- .readData(dataset, options)


 
}

.showOptions <- function(jaspResults, options) {

  options[["variables"]] <- c(options$fisherZs, 
                              options$cohenDs, 
                              options$corrs,
                              options$logORs, 
                              options$SdError, 
                              options$Var,
                              options$Ssize,
                              options$TZstat)
  
  baseTable <- createJaspTable(title = "Variables to convert")
  baseTable$addColumnInfo(name = "baseTableCl", title = "Variables", type = "string")
  baseTable[["baseTableCl"]] <- options$variables

  jaspResults[["baseTable"]] <- baseTable

}

.readData <- function(dataset, options) {

  if(!is.null(dataset)) return(dataset)

  return(.readDataSetToEnd(columns = options$variables))
}

.convertingEffectSizes <- function(dataset, options) {

  convertedVariable<- RoBMA::combine_data(d =     dataset[ ,2], 
                                          r =     dataset[ ,3],
                                          z =     dataset[ ,1],
                                          logOR = dataset[ ,4],
                                          t =     dataset[ ,8],
                                          se =    dataset[ ,5],
                                          v =     dataset[ ,6],
                                          n =     dataset[ ,7],
                                          transformation = options$EffectSizeType)
  
  


}



