//Auto-generated by RSP Compiler
//Source: searchForm.rsp.html
part of trails;

/** Template, searchForm, for rendering the view. */
Future searchForm(HttpConnect connect, {traceFormRenderer}) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  response.write("""

        <table style="width: 100% ; ">
          <tr>
             <td style="width: 2%;" ></td>
             <td style="width: 30%;" ><span class="important-text" >Textuelle</span></td>
             <td colspan="2" style="width: * ; text-align: left;"   >
                <div class="form-group form-search">
                    <input  type="text" class="form-control search-form-inputs search-form-input-text"  placeholder="">
                </div>
             </td>
             <td style="width: 2%" ></td>
          </tr>
          <tr>
             <td  ></td>
             <td  ><span class="important-text" >Activités</span></td>
             <td style="width: * ; text-align: left ;"  >
              <div class="form-inputs" >
                   <div>
"""); //#2

  for (var activity in traceFormRenderer.activities.keys) { //for#20

    response.write("""                        <div><input type="checkbox"  class="search-form-inputs search-form-input-activity"  name=\""""); //#21

    response.write(Rsp.nnx(activity)); //#21


    response.write(""""  style="vertical-align: middle;"  >&nbsp;&nbsp;<span style="vertical-align: middle;"  >"""); //#21

    response.write(Rsp.nnx(traceFormRenderer.activities[activity])); //#21


    response.write("""</span></div>
"""); //#21
  } //for

  response.write("""                   </div> 
              </div>             
             </td>
             <td  ></td>
          </tr>    
          
          <tr>
             <td ></td>
             <td ><span class="important-text" >Distance</span></td>
             <td colspan="2" style="width: * ; text-align: left;"   >
                <div class="form-inputs form-group form-length">
                    de <input  type="text" class="form-control number-input search-form-inputs search-form-input-length-gt"  placeholder="">
                    à  <input  type="text" class="form-control number-input search-form-inputs search-form-input-length-lt"  placeholder="">
                    km
                </div>
             </td>
             <td ></td>
          </tr>          
          
          <tr>
             <td ></td>
             <td ><span class="important-text" >Dénivelé</span></td>
             <td colspan="2" style="width: * ; text-align: left;"   >
                <div class="form-inputs form-group form-up">
                    de <input  type="text" class="form-control number-input search-form-inputs search-form-input-up-gt"  placeholder="">
                    à  <input  type="text" class="form-control number-input search-form-inputs search-form-input-up-lt"  placeholder="">
                    m
                </div>
             </td>
             <td ></td>
          </tr>          
          
          <tr>
             <td ></td>
             <td ><span class="important-text" >Sommet</span></td>
             <td colspan="2" style="width: * ; text-align: left;"   >
                <div class="form-inputs form-group form-upper-point-elevetion">
                    de <input  type="text" class="form-control number-input search-form-inputs search-form-input-upper-point-elevetion-gt"  placeholder="">
                    à  <input  type="text" class="form-control number-input search-form-inputs search-form-input-upper-point-elevetion-lt"  placeholder="">
                    m
                </div>
             </td>
             <td ></td>
          </tr>   
          
         <tr>
             <td ></td>
             <td ><span class="important-text" >Pente</span></td>
             <td colspan="2" style="width: * ; text-align: left;"   >
                <div class="form-inputs form-group form-inclination-up">
                    de <input  type="text" class="form-control number-input search-form-inputs search-form-input-inclination-up-gt"  placeholder="">
                    à  <input  type="text" class="form-control number-input search-form-inputs search-form-input-inclination-up-lt"  placeholder="">
                    %
                </div>
             </td>
             <td ></td>
          </tr>          
                 
         <tr>
             <td ></td>
             <td ><span class="important-text" >Difficulté</span></td>
             <td colspan="2" style="width: * ; text-align: left;"   >
                <div class="form-inputs form-group form-difficulty">
                    de <input  type="text" class="form-control number-input search-form-inputs search-form-input-difficulty-gt"  placeholder="">
                    à  <input  type="text" class="form-control number-input search-form-inputs search-form-input-difficulty-lt"  placeholder="">
                    pt
                </div>
             </td>
             <td ></td>
          </tr>
          
          <tr>
             <td  ></td>
             <td colspan="2" style="width: * ; text-align: center;"  >
                <div class="form-inputs" >
                 <button type="submit"  class="btn btn-primary search-form-btn loading-on-click">Rechercher</button>
                </div> 
             </td>
             <td  ></td>
          </tr>           
                
        </table> 
        
        
        <div class="text-warning  form-error-message" >Actuellement en construction : la possibilité de rechercher localisation, département ou massif...</div>
        
"""); //#23

  return new Future.value();
}