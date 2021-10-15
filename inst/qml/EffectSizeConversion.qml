//
// Copyright (C) 2013-2018 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//

import QtQuick			2.12
import JASP.Controls	1.0
import JASP.Widgets		1.0
import JASP				1.0
import QtQuick.Layouts	1.3

Form
{
    RadioButtonGroup
    {
        name:                   "EffectSizeType"
        title:                  qsTr("Choose your prefered effect size measure!")
        RadioButton{ name: "fishers_z"; label: qsTr("Fisher's Z"); checked: true }
        RadioButton{ name: "cohens_d";  label: qsTr("Cohen's D")                 }
        RadioButton{ name: "r";    label: qsTr("Correlation")               }
        RadioButton{ name: "logOR";   label: qsTr("Log odds ratio")            }
    }

    VariablesForm
    {
        preferredHeight: 500 * preferencesModel.uiScale 

        AvailableVariablesList{name: "allVariables"}

        AssignedVariablesList
        {
            name:           "fisherZs"
            label:          qsTr("Fisher's Z")
            allowedColumns: ["scale", "ordinal"]
            singleVariable: true
        }

        AssignedVariablesList
        { 
            name:           "cohenDs"
            label:          qsTr("Cohen's D")
            allowedColumns: ["scale", "ordinal"]
            singleVariable: true
        }

        AssignedVariablesList
        {
            name:           "corrs"
            label:          qsTr("Correlation")
            allowedColumns: ["scale", "ordinal"]
            singleVariable: true
        }

        AssignedVariablesList
        {
            name:           "logORs"
            label:          qsTr("Log odds ratio")
            allowedColumns: ["scale", "ordinal"]
            singleVariable: true
        }

        AssignedVariablesList
        {
            name: "SdError"
            label: qsTr("Stadard Error")
            allowedColumns: ["scale", "ordinal"]
            singleVariable: true   
        }
        
        AssignedVariablesList
        {
            name: "Var"
            label: qsTr("Variance")
            allowedColumns: ["scale", "ordinal"]
            singleVariable: true   
        }

        AssignedVariablesList
        {
            name: "Ssize"
            label: qsTr("Sample Size")
            allowedColumns: ["scale", "ordinal"]
            singleVariable: true   
        }

        AssignedVariablesList
        {
            name: "TZstat"
            label: qsTr("T or Z statstics")
            allowedColumns: ["scale", "ordinal"]
            singleVariable: true   
        }
    }

    Group
    {
        title: qsTr("Save the new measure!")
        TextField
        {
            name:            "newName"
            label:           qsTr("Name of the variable:")
            placeholderText: qsTr("New_Variable") 
        }

        TextField
        {
            name:            "newStandardError"
            label:           qsTr("Name of the Standard error of the new variable:")
            placeholderText: qsTr("New_Standard_Error") 
        }
    }


    

    

}