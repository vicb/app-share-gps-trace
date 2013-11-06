//Auto-generated by RSP Compiler
//Source: traceAnalysisView.rsp.html
part of trails;

/** Template, traceAnalysisView, for rendering the view. */
Future traceAnalysisView(HttpConnect connect, {traceAnalysisRenderer}) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  Rsp.init(connect, "text/html; charset=utf-8");

  response.write("""<!DOCTYPE html>
<html>
 <head>
	 <title>La Boussole - Analyse de trace</title>
"""); //#2

  return connect.include("/rsp/templates/assetsimports.html").then((_) { //include#6

    response.write("""  </head>
  <body>   
"""); //#7

    var _0 = new StringBuffer(); _cs_.add(connect); //var#10
    connect = new HttpConnect.stringBuffer(connect, _0); response = connect.response;

    response.write("""        <h1>Analyse d'une trace gpx</h1>

        <form role="form"  action="/trace.analysis" method="get" accept-charset="UTF-8">
          <div class="form-group">
            <input name="gpxFileUrl" type="text" class="form-control" id="gpxFileUrl" placeholder="Url du fichier gpx">
          </div>
          <button type="submit" class="btn btn-default">Analyser</button>
        </form>


"""); //#11

    connect = _cs_.removeLast(); response = connect.response;

    var _1 = new StringBuffer(); _cs_.add(connect); //var#22
    connect = new HttpConnect.stringBuffer(connect, _1); response = connect.response;

    return Rsp.nnf(traceProfileViewer(new HttpConnect.chain(connect), traceAnalysisRenderer: traceAnalysisRenderer)).then((_) { //include#23

      connect = _cs_.removeLast(); response = connect.response;

      var _2 = new StringBuffer(); _cs_.add(connect); //var#25
      connect = new HttpConnect.stringBuffer(connect, _2); response = connect.response;

      return Rsp.nnf(traceGpxViewer(new HttpConnect.chain(connect), traceAnalysisRenderer: traceAnalysisRenderer)).then((_) { //include#26

        connect = _cs_.removeLast(); response = connect.response;

        var _3 = new StringBuffer(); _cs_.add(connect); //var#28
        connect = new HttpConnect.stringBuffer(connect, _3); response = connect.response;

        return Rsp.nnf(traceStatisticsViewer(new HttpConnect.chain(connect), traceAnalysisRenderer: traceAnalysisRenderer)).then((_) { //include#29

          connect = _cs_.removeLast(); response = connect.response;

          return Rsp.nnf(spaces(new HttpConnect.chain(connect), nw: _0.toString(), ne: _1.toString(), sw: _2.toString(), se: _3.toString())).then((_) { //include#9

            response.write("""    
    <script type="application/dart" src="client/traceAnalysis.dart"></script>
    <script src="packages/browser/dart.js"></script>
    <script src="packages/browser/interop.js"></script>
  </body>
</html>"""); //#32

            return Rsp.nnf();
          }); //end-of-include
        }); //end-of-include
      }); //end-of-include
    }); //end-of-include
  }); //end-of-include
}
