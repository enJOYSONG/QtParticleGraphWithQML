import QtQuick 2.0

Item {
    property var caArray: [
        {Name:"과염소산칼륨\n(KCIO4)",XmlName:"KCIO4"},
        {Name:"질산칼륨\n(KNO3)",XmlName:"KNO3"},
        {Name:"숯\n(C3)",XmlName:"C3"},
        {Name:"염화고무\n(Rubber)",XmlName:"Rubber"},
        {Name:"탄산나트륨\n(Na2CO3)",XmlName:"Na2CO3"},
        {Name:"스트론튬\n(Sr)",XmlName:"Sr"},
        {Name:"알루미늄\n(Al)",XmlName:"Al"},
        {Name:"황\n(S)",XmlName:"S"},
        {Name:"붕산\n(H3BO3)",XmlName:"H3BO3"},
        {Name:"헥사메틸렌\n테트라민\n(C6H2N4)",XmlName:"C6H2N4"},
        {Name:"산화철\n(Fe2O3)",XmlName:"Fe2O3"},
        {Name:"덱스트린\nDextrin",XmlName:"Dextrin"},
        {Name:"질산바륨\n(Ba(NO3)2)",XmlName:"BaNO32"}
    ]

    function getIndex(str) {
        for(var i=0 ; i < caArray.length() ; i++) {
            if(caArray[i].XmlName === str)
                return i
        }
    }
}

