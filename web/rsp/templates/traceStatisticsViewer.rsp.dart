//Auto-generated by RSP Compiler
//Source: traceStatisticsViewer.rsp.html
part of trails;

/** Template, traceStatisticsViewer, for rendering the view. */
Future traceStatisticsViewer(HttpConnect connect, {traceAnalysisRenderer}) { //#3
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  if (traceAnalysisRenderer != null) { //if#3

    response.write("""       <div id="traceStatisticsViewer"> 
          <table  class="table-layout" >
              <tr>
                <td  ><span  class="cell-text-large" >"""); //#4

    response.write(Rsp.nnx(traceAnalysisRenderer.lengthKmPart)); //#7


    response.write(""" km</span>&nbsp;
                      <span  class="cell-text-small" >"""); //#7

    response.write(Rsp.nnx(traceAnalysisRenderer.lengthMetersPart)); //#8


    response.write(""" m</span></td>
                <td class="cell-text-large" >"""); //#8

    response.write(Rsp.nnx(traceAnalysisRenderer.up)); //#9


    response.write(""" m</td>
              </tr>
              <tr>
                <td class="cell-text-small" >de distance</td>
                <td class="cell-text-small" >de dénivelé positif</td>
              </tr>
              <tr>
                <td class="cell-text-large" colspan="2" >&nbsp;</td>
              </tr>              
              <tr>
                <td class="cell-text-large" >"""); //#9

    response.write(Rsp.nnx(traceAnalysisRenderer.inclinationUp)); //#19


    response.write(""" %</td>
                <td class="cell-text-large" >"""); //#19

    response.write(Rsp.nnx(traceAnalysisRenderer.upperPointElevetion)); //#20


    response.write(""" m</td>
              </tr>
              <tr>
                <td class="cell-text-small" >d'inclinaison moyenne</td>
                <td class="cell-text-small" >au sommet</td>
              </tr>
              <tr>
                <td class="cell-text-large" colspan="2" >&nbsp;</td>
              </tr>              
              <tr>
                <td class="cell-text-large" colspan="2">"""); //#20

    response.write(Rsp.nnx(traceAnalysisRenderer.difficulty)); //#30


    response.write(""" points</td>
              </tr>
              <tr>
                <td class="cell-text-small" colspan="2">de difficulté</td>
              </tr>        
          </table>
        </div>
"""); //#30
  } //if

  return new Future.value();
}
