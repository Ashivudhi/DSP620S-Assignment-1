public function main (string... args) {

    CaliBlockingClient blockingEp = new("http://localhost:9090");
    
    var result = blockingEp->writeRecord(
        {
            rKey: " ",
            rVersion: 100002,
            date: "22-03-2020",
            band: "dspbando",
            artists: [
                { 
                    name: "Erro",
                    member: "no"
                }
                ],
                songs: [
                    {
                        title: "music",
                        genre: "Pop",
                        platform: "Youtube"
                    }
                ]
        }
    );

}


