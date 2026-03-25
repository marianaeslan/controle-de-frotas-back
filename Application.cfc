component {

    this.name = "ControleFrota";
    this.applicationTimeout = createTimeSpan(1, 0, 0, 0);
    this.mappings["/"] = getDirectoryFromPath(getCurrentTemplatePath());

    public boolean function onApplicationStart() {
        application.frota = [];
        return true;
    }

    public boolean function onRequestStart(string targetPage) {

        if (url.keyExists("reload")) {
            applicationStop();
            writeOutput('{"status": "Aplicacao reiniciada, banco de dados zerado"}');
            abort;
        }

        cfheader(name="Access-Control-Allow-Origin", value="*");
        cfheader(name="Access-Control-Allow-Methods", value="GET, POST, PUT, DELETE, OPTIONS");
        cfheader(name="Access-Control-Allow-Headers", value="Content-Type, Authorization");

        if (cgi.request_method == "OPTIONS") {
            abort;
        }

        return true;
    }

}