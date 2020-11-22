import ballerina/grpc;
import ballerina/crypto;
import ballerina/io;

listener grpc:Listener ep = new (9090);

function writeIntoJson(json content, string path) returns @tainted error? {

    io:WritableByteChannel wbc = check io:openWritableFile(path);

     io:WritableCharacterChannel wch = new (wbc, "UTF8");
     var result = wch.writeJson(content);

     var close = wch.close();
}

function readIntoJson(string path) returns @tainted json|error{
    io:ReadableByteChannel rbc = check io:openReadableFile(path);

        io:ReadableCharacterChannel rch = new (rbc, "UTF8");
        var result = rch.readJson();
        var close = rch.close();

        return result;
}

service Cali on ep {

    resource function writeRecord(grpc:Caller caller, NewRecordRequest value) {
        // Implementation goes here.
        //We assign a
            string input = value.toString();
            byte[] inputArr = input.toBytes();

            byte[] output = crypto:hashMd5(inputArr);
            string recordKey = output.toBase64();
            //assigning hashed key to Record key
            value.rKey = recordKey;

            //version implementation

            //byte[] rVersion =

            //json newRecord = <json>json.constructFrom(value); type casting
            json|error newRecord = json.constructFrom(value);
            json[] allRecords = [];
            io:println(newRecord);
            if(newRecord is error){
                ///
            }else{
                //tried reading the file first before saving
                //allRecords.push(newRecord);
                //var readfile = readIntoJson("./storage.json");
                //if(readfile is error){
                //    io:println(readfile);
                //}else {
                //	io:println(readfile);
                //
                //	allRecords = readfile;
                	allRecords.push(newRecord);

                	                var writingfile = writeIntoJson(allRecords,"./storage.json");
                                    if(writingfile is error){
                                        io:println(writingfile.detail());
                                    }else{
                                        io:println("Successfully stored!!");
                                    }
                }


            //}



        // You should return a NewRecordResponse
    }
    resource function updateRecord(grpc:Caller caller, UpdateRecordRequest value) {
        // Implementation goes here.

        // You should return a UpdateRecordResponse
    }
    resource function readRecord(grpc:Caller caller, ReadRecordRequest value) {
        // Implementation goes here.

        // You should return a ReadRecordResponse
    }
    resource function readRecord_Key_Version(grpc:Caller caller, ReadRecordRequest_key_Version value) {
        // Implementation goes here.

        // You should return a ReadRecordResponse
    }
    @grpc:ResourceConfig { streaming: true } 
    resource function readRecord_Criterion(grpc:Caller caller, ReadCriterionRequest value) {
        // Implementation goes here.

        // You should return a ReadRecordResponse
    }
}

public type Artists record {|
    string name = "";
    string member = "";
    
|};

public type Songs record {|
    string title = "";
    string genre = "";
    string platform = "";
    
|};

public type NewRecordRequest record {|
    string rKey = "";
    int rVersion = 0;
    string date = "";
    Artists[] artists = [];
    string band = "";
    Songs[] songs = [];
    
|};

public type RecordCopy record {|
    string rKey = "";
    int rVersion = 0;
    string date = "";
    Artists[] artists = [];
    string band = "";
    Songs[] songs = [];
    
|};

public type NewRecordResponse record {|
    string rkey = "";
    string rVersion = "";
    
|};

public type UpdateRecordRequest record {|
    string rKey = "";
    string rVersion = "";
    RecordCopy? rCopy = ();
    
|};

public type UpdateRecordResponse record {|
    string rKey = "";
    string rVersion = "";
    
|};

public type ReadRecordRequest record {|
    string rKey = "";
    
|};

public type ReadRecordResponse record {|
    string rKey = "";
    int rVersion = 0;
    string date = "";
    Artists[] artists = [];
    string band = "";
    Songs[] songs = [];
    
|};

public type ReadRecordRequest_key_Version record {|
    string rKey = "";
    int rVersion = 0;
    
|};

public type ReadCriterionRequest record {|
    string songTitle = "";
    string artistName = "";
    string band = "";
    
|};



const string ROOT_DESCRIPTOR = "0A1473746F726167652D73797374656D2E70726F746F1207736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22350A074172746973747312120A046E616D6518012001280952046E616D6512160A066D656D62657218022001280952066D656D626572224F0A05536F6E677312140A057469746C6518012001280952057469746C6512140A0567656E7265180220012809520567656E7265121A0A08706C6174666F726D1803200128095208706C6174666F726D22BC010A104E65775265636F72645265717565737412120A04724B65791805200128095204724B6579121A0A087256657273696F6E18062001280552087256657273696F6E12120A0464617465180120012809520464617465122A0A076172746973747318022003280B32102E736572766963652E4172746973747352076172746973747312120A0462616E64180320012809520462616E6412240A05736F6E677318042003280B320E2E736572766963652E536F6E67735205736F6E677322B6010A0A5265636F7264436F707912120A04724B65791805200128095204724B6579121A0A087256657273696F6E18062001280552087256657273696F6E12120A0464617465180120012809520464617465122A0A076172746973747318022003280B32102E736572766963652E4172746973747352076172746973747312120A0462616E64180320012809520462616E6412240A05736F6E677318042003280B320E2E736572766963652E536F6E67735205736F6E677322430A114E65775265636F7264526573706F6E736512120A04726B65791801200128095204726B6579121A0A087256657273696F6E18022001280952087256657273696F6E22700A135570646174655265636F72645265717565737412120A04724B65791801200128095204724B6579121A0A087256657273696F6E18022001280952087256657273696F6E12290A0572436F707918032001280B32132E736572766963652E5265636F7264436F7079520572436F707922460A145570646174655265636F7264526573706F6E736512120A04724B65791801200128095204724B6579121A0A087256657273696F6E18022001280952087256657273696F6E22270A11526561645265636F72645265717565737412120A04724B65791801200128095204724B657922BE010A12526561645265636F7264526573706F6E736512120A04724B65791805200128095204724B6579121A0A087256657273696F6E18062001280552087256657273696F6E12120A0464617465180120012809520464617465122A0A076172746973747318022003280B32102E736572766963652E4172746973747352076172746973747312120A0462616E64180320012809520462616E6412240A05736F6E677318042003280B320E2E736572766963652E536F6E67735205736F6E6773224F0A1D526561645265636F7264526571756573745F6B65795F56657273696F6E12120A04724B65791801200128095204724B6579121A0A087256657273696F6E18022001280552087256657273696F6E22680A1452656164437269746572696F6E52657175657374121C0A09736F6E675469746C651801200128095209736F6E675469746C65121E0A0A6172746973744E616D65180220012809520A6172746973744E616D6512120A0462616E64180320012809520462616E643295030A0443616C6912440A0B77726974655265636F726412192E736572766963652E4E65775265636F7264526571756573741A1A2E736572766963652E4E65775265636F7264526573706F6E7365124B0A0C7570646174655265636F7264121C2E736572766963652E5570646174655265636F7264526571756573741A1D2E736572766963652E5570646174655265636F7264526573706F6E736512450A0A726561645265636F7264121A2E736572766963652E526561645265636F7264526571756573741A1B2E736572766963652E526561645265636F7264526573706F6E7365125D0A16726561645265636F72645F4B65795F56657273696F6E12262E736572766963652E526561645265636F7264526571756573745F6B65795F56657273696F6E1A1B2E736572766963652E526561645265636F7264526573706F6E736512540A14726561645265636F72645F437269746572696F6E121D2E736572766963652E52656164437269746572696F6E526571756573741A1B2E736572766963652E526561645265636F7264526573706F6E73653001620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "storage-system.proto":"0A1473746F726167652D73797374656D2E70726F746F1207736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22350A074172746973747312120A046E616D6518012001280952046E616D6512160A066D656D62657218022001280952066D656D626572224F0A05536F6E677312140A057469746C6518012001280952057469746C6512140A0567656E7265180220012809520567656E7265121A0A08706C6174666F726D1803200128095208706C6174666F726D22BC010A104E65775265636F72645265717565737412120A04724B65791805200128095204724B6579121A0A087256657273696F6E18062001280552087256657273696F6E12120A0464617465180120012809520464617465122A0A076172746973747318022003280B32102E736572766963652E4172746973747352076172746973747312120A0462616E64180320012809520462616E6412240A05736F6E677318042003280B320E2E736572766963652E536F6E67735205736F6E677322B6010A0A5265636F7264436F707912120A04724B65791805200128095204724B6579121A0A087256657273696F6E18062001280552087256657273696F6E12120A0464617465180120012809520464617465122A0A076172746973747318022003280B32102E736572766963652E4172746973747352076172746973747312120A0462616E64180320012809520462616E6412240A05736F6E677318042003280B320E2E736572766963652E536F6E67735205736F6E677322430A114E65775265636F7264526573706F6E736512120A04726B65791801200128095204726B6579121A0A087256657273696F6E18022001280952087256657273696F6E22700A135570646174655265636F72645265717565737412120A04724B65791801200128095204724B6579121A0A087256657273696F6E18022001280952087256657273696F6E12290A0572436F707918032001280B32132E736572766963652E5265636F7264436F7079520572436F707922460A145570646174655265636F7264526573706F6E736512120A04724B65791801200128095204724B6579121A0A087256657273696F6E18022001280952087256657273696F6E22270A11526561645265636F72645265717565737412120A04724B65791801200128095204724B657922BE010A12526561645265636F7264526573706F6E736512120A04724B65791805200128095204724B6579121A0A087256657273696F6E18062001280552087256657273696F6E12120A0464617465180120012809520464617465122A0A076172746973747318022003280B32102E736572766963652E4172746973747352076172746973747312120A0462616E64180320012809520462616E6412240A05736F6E677318042003280B320E2E736572766963652E536F6E67735205736F6E6773224F0A1D526561645265636F7264526571756573745F6B65795F56657273696F6E12120A04724B65791801200128095204724B6579121A0A087256657273696F6E18022001280552087256657273696F6E22680A1452656164437269746572696F6E52657175657374121C0A09736F6E675469746C651801200128095209736F6E675469746C65121E0A0A6172746973744E616D65180220012809520A6172746973744E616D6512120A0462616E64180320012809520462616E643295030A0443616C6912440A0B77726974655265636F726412192E736572766963652E4E65775265636F7264526571756573741A1A2E736572766963652E4E65775265636F7264526573706F6E7365124B0A0C7570646174655265636F7264121C2E736572766963652E5570646174655265636F7264526571756573741A1D2E736572766963652E5570646174655265636F7264526573706F6E736512450A0A726561645265636F7264121A2E736572766963652E526561645265636F7264526571756573741A1B2E736572766963652E526561645265636F7264526573706F6E7365125D0A16726561645265636F72645F4B65795F56657273696F6E12262E736572766963652E526561645265636F7264526571756573745F6B65795F56657273696F6E1A1B2E736572766963652E526561645265636F7264526573706F6E736512540A14726561645265636F72645F437269746572696F6E121D2E736572766963652E52656164437269746572696F6E526571756573741A1B2E736572766963652E526561645265636F7264526573706F6E73653001620670726F746F33",
        "google/protobuf/wrappers.proto":"0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"
        
    };
}

