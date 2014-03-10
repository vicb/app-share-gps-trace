//Auto-generated by RSP Compiler
//Source: traceFormFragment.rsp.html
part of trails;

/** Template, traceFormFragment, for rendering the view. */
Future traceFormFragment(HttpConnect connect, {traceFormRenderer}) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  response.write("""        <form id="trace-add-form" role="form"  action="/trace" method="post" accept-charset="UTF-8" enctype="multipart/form-data" >
          <table class="table-form" style="width: 100% ; ">
          <tr>
             <td style="width: 20%;" ></td>
             <td colspan="2" style="width: * ; text-align: center;"   >
                <div class="form-inputs" >
                    <input name="title" type="text" class="form-control" style="width: 80%" placeholder="Titre">
                </div>
             </td>
             <td style="width: 20%" ></td>
          </tr>
          <tr>
             <td  ></td>
             <td colspan="2" style="width: * ; text-align: center;"  >
                <div class="form-inputs">
                  <textarea name="description" class="form-control" style="width: 80%" rows="12" placeholder="Description du parcours" ></textarea>
                </div>              
             </td>
             <td  ></td>
          </tr>
          <tr>
             <td  ></td>
             <td style="width: 20%  ; " ></td>
             <td style="width: * ; text-align: left ;"  >
              <div class="form-inputs" style="width: * ; text-align: left ;" >
                   <div style="text-align: left ;">
"""); //#2

  for (var activity in traceFormRenderer.activities.keys) { //for#28

    response.write("""                        <div style="text-align: left ;" ><input type="checkbox" name=\""""); //#29

    response.write(Rsp.nnx(activity)); //#29


    response.write(""""  style="text-align: left ;vertical-align: middle;"  >&nbsp;&nbsp;<span style="vertical-align: middle;"  >"""); //#29

    response.write(Rsp.nnx(traceFormRenderer.activities[activity])); //#29


    response.write("""</span></div>
"""); //#29
  } //for

  response.write("""                   </div> 
              </div>             
             </td>
             <td  ></td>
          </tr>
          <tr>
             <td  ></td>
             <td colspan="2" style="width: * ; text-align: center;"  >
                <div class="form-inputs" >
                  <input name="gpxUploadedFile" type="file" title="Télécharger un fichier gpx" placeholder="Télécharger un fichier gpx" />
                </div>             
             </td>
             <td  ></td>
          </tr> 
          <tr>
             <td  ></td>
             <td colspan="2" style="width: * ; text-align: center;"  >
                <div class="form-inputs" >
                   <select  name="smoothing" >
                    <option value="no">Aucun lissage</option>
                    <option value="low">Lissage faible</option>
                    <option value="medium">Lissage moyen</option>
                    <option value="high">Lissage fort</option>
                  </select>
                </div>             
             </td>
             <td  ></td>
          </tr>          
          <tr>
             <td  ></td>
             <td colspan="2" style="width: * ; text-align: center;"  >
                <div class="form-inputs" >
                 <button type="submit"  class="btn btn-primary btn-add-trace loading-on-click">Ajouter cette trace</button>
                </div> 
             </td>
             <td  ></td>
          </tr>                              
          </table>
        </form>

"""); //#31

  return new Future.value();
}
