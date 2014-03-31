//Auto-generated by RSP Compiler
//Source: traceSearchResultsFragment.rsp.html
part of trails;

/** Template, traceSearchResultsFragment, for rendering the view. */
Future traceSearchResultsFragment(HttpConnect connect) { //#2
  var _t0_, _cs_ = new List<HttpConnect>();
  HttpRequest request = connect.request;
  HttpResponse response = connect.response;
  if (!Rsp.init(connect, "text/html; charset=utf-8"))
    return new Future.value();

  response.write("""

                        <input type="hidden" class="search-form-inputs search-form-bounds-location" id="search-form-input-location-ne-lat" />
                        <input type="hidden" class="search-form-inputs search-form-bounds-location" id="search-form-input-location-ne-long" />
                        <input type="hidden" class="search-form-inputs search-form-bounds-location" id="search-form-input-location-sw-lat" />
                        <input type="hidden" class="search-form-inputs search-form-bounds-location" id="search-form-input-location-sw-long" />
                        <input type="hidden" id="search-form-js-dart-bridge" />  

      <div  class="gx-vertical-optional-scroll">
        <table  style="width: 100% ;margin-top: 0px ;  background-color: #CFCFCF">  
          <thead>  
            <tr>  
              <th style="width: 10%" >Auteur</th>  
              <th style="width: *" >Trace</th>  
              <th style="width: 15%" >Activités</th>  
              <th style="width: 15%" >Distance</th>  
              <th style="width: 15%" >Dénivelé</th>
              <th style="width: 15%" >Sommet</th>
            </tr>  
             <tr style="border-left-style: none;" >
                  <td></td>
                  <td  class="gx-small-form-input"  >
                    <span   class="gx-vertical-text-align">
                      <input  type="text"  style="width:100% ;  padding-left: 3px ; padding-right: 3px"  class="gx-small-form-input  search-form-input-text"  placeholder="">
                    </span>
                  </td>   
                  <td></td>
                  <td class="gx-small-form-input"  >
                    <span class="gx-vertical-text-align">
                      <input  type="text"    class="gx-small-form-input  search-form-input-length-gt"  placeholder="">
                      à  <input  type="text" class="gx-small-form-input  search-form-input-length-lt"  placeholder="">
                      km
                    </span>
                  </td>  
                  <td class="gx-small-form-input"  >
                    <span class="gx-vertical-text-align">
                      <input  type="text"    class="gx-small-form-input  search-form-input-up-gt"  placeholder="">
                      à  <input  type="text" class="gx-small-form-input  search-form-input-up-lt"  placeholder="">
                      m
                    </span>
                  </td> 
                  <td class="gx-small-form-input"  >
                    <span class="gx-vertical-text-align">
                      <input  type="text"    class="gx-small-form-input  search-form-input-upper-point-elevetion-gt"  placeholder="">
                      à  <input  type="text" class="gx-small-form-input  search-form-input-upper-point-elevetion-lt"  placeholder="">
                      m
                    </span>
                  </td>                   
             </tr>            
          </thead>  
        </table>
      </div>
      <div id="trace-search-results-content" class="gx-vertical-optional-scroll">      
        <table class="table" style="width: 100% ;margin-top: 0px"> 
          <tbody id="search-result-body" >  
             <tr id="search-result-row" class="gx-hidden" >
                  <td></td>  
                  <td></td>  
                  <td></td>
                  <td></td>  
                  <td></td>
                  <td></td>
             </tr>
          </tbody>  
        </table>
      </div>"""); //#2

  return new Future.value();
}
