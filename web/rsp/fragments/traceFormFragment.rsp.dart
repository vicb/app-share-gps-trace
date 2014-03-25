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

  response.write("""          <table class="table-form" style="width: 100% ; ">
          <tr>
             <td style="width: 10%;" ></td>
             <td colspan="4" style="width: * ; text-align: center;"   >
                <div class="form-inputs" >
                    <input name="title" type="text" class="trace-form-input form-control" style="width: 80%" placeholder="Titre">
                </div>
             </td>
             <td style="width: 10%" ></td>
          </tr>
          <tr>
             <td  ></td>
             <td colspan="2" style="width: 50% ; text-align: center;"  >
                <div class="form-inputs">
                  <textarea name="description" class="trace-form-input form-control" style="width: 80%" rows="12" placeholder="Description du parcours" ></textarea>
                </div>              
             </td>
             <td colspan="2" style="width: 30% ; text-align: left ;"  >
              <div class="form-inputs" style="width: * ; text-align: left ;" >
                   <div style="text-align: left ;">
"""); //#2

  for (var activity in traceFormRenderer.activities.keys) { //for#22

    response.write("""                        <div style="text-align: left ;" ><input name=\""""); //#23

    response.write(Rsp.nnx(activity)); //#23


    response.write(""""  type="checkbox" name=\""""); //#23

    response.write(Rsp.nnx(activity)); //#23


    response.write(""""  class="trace-form-input form-control" style="text-align: left ;vertical-align: middle;"  >&nbsp;&nbsp;<span style="vertical-align: middle;"  >"""); //#23

    response.write(Rsp.nnx(traceFormRenderer.activities[activity])); //#23


    response.write("""</span></div>
"""); //#23
  } //for

  response.write("""                   </div> 
              </div>             
             </td>   
             <td  ></td>
          </tr>
          <tr>
             <td  ></td>
             <td colspan="2" style="width: 50% ; text-align: center;"  >
                <div class="form-inputs" >
                  <input  class="trace-form-file-input form-control"   name="gps-file" type="file" title="Télécharger un fichier gpx" placeholder="Télécharger un fichier gpx" />
                </div>             
             </td>
             <td colspan="2" style="width: 30% ; text-align: center;"  >
                <div class="trace-form-file-smoothing form-inputs" >
                   <select  name="smoothing" class="trace-form-input form-control">
                    <option value="no">Aucun lissage</option>
                    <option value="low">Lissage faible</option>
                    <option value="medium">Lissage moyen</option>
                    <option value="high">Lissage fort</option>
                  </select>
                </div>             
             </td>             
             <td  ></td>
          </tr> 
          </table>
"""); //#25

  return new Future.value();
}
