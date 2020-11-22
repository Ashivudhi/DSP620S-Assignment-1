import ballerina/grpc;
import ballerina/io;

public function main(string... args) {

    CaliBlockingClient blockingEp = new ("http://localhost:9090");

    io:println("************* Interface *************");
    io:println("1. Write a new Record");
    io:println("2. Update a Record");
    io:println("3. Read a Record with Version & Key");
    io:println("4. Read a Record with Key");
    io:println("5. Read with Criterion");


    string option = io:readln("Choose an option");

    if (option == "1") {
        var result = blockingEp->writeRecord(
        {
            rKey: " ",
            rVersion: 3,
            date: "22/03/2020",
            band: "dspbando",
            artists: [
                    {
                        name: "Remaider",
                        member: "yes"
                    },
                    {
                        name: "David",
                        member: "yes"
                    },
                    {
                        name: "Nairenge",
                        member: "no"
                    }
                ],
            songs: [
                    {
                        title: "music",
                        genre: "Kwaito",
                        platform: "Audiomac"
                    }
                ]
        }
        );
        if (result is grpc:Error) {
            io:println(result);
        } else {
            io:println(result);
        }

    } else if (option == "2") {
        var updaterec = blockingEp->updateRecord({
            rKey: "1606afdcf282f39fb337a1754d18c692",
            rVersion: 1,
            rCopy: {
                rKey: " ",
                rVersion: 1,
                date: "22/03/2020",
                band: "Isaac",
                artists: [
                        {
                            name: "Oppo",
                            member: "no"
                        },
                        {
                            name: "Yes",
                            member: "no"
                        }
                    ],
                songs: [
                        {
                            title: "Hello",
                            genre: "Country",
                            platform: "Youtube"
                        }
                    ]
            }

        });

        if (updaterec is grpc:Error) {
            io:println(updaterec);
        } else {
            io:println(updaterec);
        }
    } else if (option == "3") {
        var readwithKeyVersion = blockingEp->readRecord_Key_Version({rKey: "1606afdcf282f39fb337a1754d18c692", rVersion: 3});

        if (readwithKeyVersion is grpc:Error) {
            io:println(readwithKeyVersion);
        } else {
            io:println(readwithKeyVersion);
        }

    } else if (option == "4") {

        var readwithKey = blockingEp->readRecord({rKey: "1606afdcf282f39fb337a1754d18c692"});

        if (readwithKey is grpc:Error) {
            io:println(readwithKey);
        } else {
            io:println(readwithKey);
        }
    }





//   if(result is grpc:Error){
//          io:println(result);
//      }else{
//          io:println(result);
//      }

//var updaterec = blockingEp->updateRecord({rKey: "1606afdcf282f39fb337a1754d18c692",rVersion: 1,
// rCopy:{
//     rKey: " ",
//     rVersion: 1,
//     date: "22/03/2020",
//     band: "3boys",
//     artists: [
//             {
//                 name: "Lemina",
//                 member: "yes"
//             },
//             {
//                 name: "Simon",
//                 member: "yes"
//             },
//              {
//                 name: "Cheeek",
//                 member: "no"
//             }
//         ],
//     songs: [
//             {
//                 title: "Hello",
//                 genre: "Country",
//                 platform: "Youtube"
//             }
//         ]
// }
//
// });
// if(updaterec is grpc:Error){
//              io:println(updaterec);
//          }else{
//              io:println(updaterec);
//          }
//
//      var readwithKeyVersion = blockingEp->readRecord_Key_Version({rKey: "5a271f7828566a3998ee176486316ae3", rVersion: 3});
//
//      if (readwithKeyVersion is grpc:Error) {
//          io:println(readwithKeyVersion);
//      } else {
//          io:println(readwithKeyVersion);
//      }
//
//      var readwithKey = blockingEp->readRecord({rKey: "5a271f7828566a3998ee176486316ae3"});
//
//      if (readwithKey is grpc:Error) {
//          io:println(readwithKey);
//      } else {
//          io:println(readwithKey);
//      }

}







