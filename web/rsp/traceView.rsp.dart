//Auto-generated by RSP Compiler
//Source: traceView.rsp.html
part of trails;

/** Template, traceView, for rendering the view. */
Future traceView(HttpConnect connect, {traceRenderer}) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  response.write("""<!DOCTYPE html>
<html>
 <head>
   <title>La Boussole - """); //#2

  response.write(Rsp.nnx(traceRenderer.trace.title)); //#5


  response.write("""</title>
"""); //#5

  return connect.include("/rsp/templates/assetsimports.html").then((_) { //include#6

    response.write("""  </head>
  <body>   
"""); //#7

    var _0 = new StringBuffer(); _cs_.add(connect); //var#10
    connect = new HttpConnect.stringBuffer(connect, _0); response = connect.response;

    return Rsp.nnf(traceProfileViewer(new HttpConnect.chain(connect), traceAnalysisRenderer: traceRenderer.traceAnalysisRenderer)).then((_) { //include#11

      connect = _cs_.removeLast(); response = connect.response;

      var _1 = new StringBuffer(); _cs_.add(connect); //var#13
      connect = new HttpConnect.stringBuffer(connect, _1); response = connect.response;

      response.write("""               <h1>"""); //#14

      response.write(Rsp.nnx(traceRenderer.trace.title)); //#14


      response.write("""</h1>
               
               <span class="trace-description" >
                 """); //#14

      response.write(Rsp.nnx(traceRenderer.description, encode: 'none')); //#17


      response.write("""

               </span>
               
               <span><a href=\""""); //#17

      response.write(Rsp.nnx(traceRenderer.gpxUrl)); //#20


      response.write("""">Lien permanent de cette page</a></span>
"""); //#20

      connect = _cs_.removeLast(); response = connect.response;

      var _2 = new StringBuffer(); _cs_.add(connect); //var#22
      connect = new HttpConnect.stringBuffer(connect, _2); response = connect.response;

      return Rsp.nnf(traceGpxViewer(new HttpConnect.chain(connect), traceAnalysisRenderer: traceRenderer.traceAnalysisRenderer)).then((_) { //include#23

        connect = _cs_.removeLast(); response = connect.response;

        var _3 = new StringBuffer(); _cs_.add(connect); //var#25
        connect = new HttpConnect.stringBuffer(connect, _3); response = connect.response;

        return Rsp.nnf(traceStatisticsViewer(new HttpConnect.chain(connect), traceAnalysisRenderer: traceRenderer.traceAnalysisRenderer)).then((_) { //include#26

          connect = _cs_.removeLast(); response = connect.response;

          return Rsp.nnf(spaces(new HttpConnect.chain(connect), nw: _0.toString(), ne: _1.toString(), sw: _2.toString(), se: _3.toString())).then((_) { //include#9

            response.write("""    
    <script type="application/dart" src="/client/traceAnalysis.dart"></script>
    <script src="/packages/browser/dart.js"></script>
    <script src="/packages/browser/interop.js"></script>
  </body>
</html>"""); //#29

            return new Future.value();
          }); //end-of-include
        }); //end-of-include
      }); //end-of-include
    }); //end-of-include
  }); //end-of-include
}