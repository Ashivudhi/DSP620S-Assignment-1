import ballerina/grpc;

public type RecordsBlockingClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function new(NewRecordRequest req, grpc:Headers? headers = ()) returns ([NewRecordResponse, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("Records/new", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<NewRecordResponse>result, resHeaders];
        
    }

    public remote function update(UpdateRecordRequest req, grpc:Headers? headers = ()) returns ([UpdateRecordResponse, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("Records/update", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<UpdateRecordResponse>result, resHeaders];
        
    }

    public remote function read(ReadRecordRequest req, grpc:Headers? headers = ()) returns ([ReadRecordResponse, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("Records/read", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<ReadRecordResponse>result, resHeaders];
        
    }

};

public type RecordsClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "non-blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function new(NewRecordRequest req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("Records/new", req, msgListener, headers);
    }

    public remote function update(UpdateRecordRequest req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("Records/update", req, msgListener, headers);
    }

    public remote function read(ReadRecordRequest req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("Records/read", req, msgListener, headers);
    }

};

public type artists record {|
    string name = "";
    boolean member = false;
    
|};


public type songs record {|
    string title = "";
    string genre = "";
    string platform = "";
    
|};


public type band record {|
    string name = "";
    
|};


public type date record {|
    int date = 0;
    
|};


public type NewRecordRequest record {|
    artists? artists = ();
    songs? songs = ();
    
|};


public type NewRecordResponse record {|
    string key = "";
    
|};


public type UpdateRecordRequest record {|
    string key = "";
    
|};


public type UpdateRecordResponse record {|
    string key = "";
    
|};


public type ReadRecordRequest record {|
    
|};


public type ReadRecordResponse record {|
    
|};



const string ROOT_DESCRIPTOR = "0A1473746F726167652D73797374656D2E70726F746F1A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F22350A076172746973747312120A046E616D6518012001280952046E616D6512160A066D656D62657218022001280852066D656D626572224F0A05736F6E677312140A057469746C6518012001280952057469746C6512140A0567656E7265180220012809520567656E7265121A0A08706C6174666F726D1803200128095208706C6174666F726D221A0A0462616E6412120A046E616D6518012001280952046E616D65221A0A046461746512120A046461746518012001280552046461746522540A104E65775265636F72645265717565737412220A076172746973747318012001280B32082E61727469737473520761727469737473121C0A05736F6E677318022001280B32062E736F6E67735205736F6E677322250A114E65775265636F7264526573706F6E736512100A036B657918012001280952036B657922270A135570646174655265636F72645265717565737412100A036B657918012001280952036B657922280A145570646174655265636F7264526573706F6E736512100A036B657918012001280952036B657922130A11526561645265636F72645265717565737422140A12526561645265636F7264526573706F6E7365329F010A075265636F726473122C0A036E657712112E4E65775265636F7264526571756573741A122E4E65775265636F7264526573706F6E736512350A0675706461746512142E5570646174655265636F7264526571756573741A152E5570646174655265636F7264526573706F6E7365122F0A047265616412122E526561645265636F7264526571756573741A132E526561645265636F7264526573706F6E7365620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "storage-system.proto":"0A1473746F726167652D73797374656D2E70726F746F1A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F22350A076172746973747312120A046E616D6518012001280952046E616D6512160A066D656D62657218022001280852066D656D626572224F0A05736F6E677312140A057469746C6518012001280952057469746C6512140A0567656E7265180220012809520567656E7265121A0A08706C6174666F726D1803200128095208706C6174666F726D221A0A0462616E6412120A046E616D6518012001280952046E616D65221A0A046461746512120A046461746518012001280552046461746522540A104E65775265636F72645265717565737412220A076172746973747318012001280B32082E61727469737473520761727469737473121C0A05736F6E677318022001280B32062E736F6E67735205736F6E677322250A114E65775265636F7264526573706F6E736512100A036B657918012001280952036B657922270A135570646174655265636F72645265717565737412100A036B657918012001280952036B657922280A145570646174655265636F7264526573706F6E736512100A036B657918012001280952036B657922130A11526561645265636F72645265717565737422140A12526561645265636F7264526573706F6E7365329F010A075265636F726473122C0A036E657712112E4E65775265636F7264526571756573741A122E4E65775265636F7264526573706F6E736512350A0675706461746512142E5570646174655265636F7264526571756573741A152E5570646174655265636F7264526573706F6E7365122F0A047265616412122E526561645265636F7264526571756573741A132E526561645265636F7264526573706F6E7365620670726F746F33",
        "google/protobuf/timestamp.proto":"0A1F676F6F676C652F70726F746F6275662F74696D657374616D702E70726F746F120F676F6F676C652E70726F746F627566223B0A0954696D657374616D7012180A077365636F6E647318012001280352077365636F6E647312140A056E616E6F7318022001280552056E616E6F7342580A13636F6D2E676F6F676C652E70726F746F627566420E54696D657374616D7050726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"
        
    };
}

