<?php $this->load->view("partial/header.tpl"); ?>
<style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
      .controls {
        margin-top: 16px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
        background-color: #fff;
        padding: 0 11px 0 13px;
        width: 400px;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        text-overflow: ellipsis;
      }

      #pac-input:focus {
        border-color: #4d90fe;
        margin-left: -1px;
        padding-left: 14px;  /* Regular padding-left + 1. */
        width: 401px;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }



}

    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
<script type="text/javascript">
    function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(-33.8688, 151.2195),
    zoom: 13
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);

  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));

  var types = document.getElementById('type-selector');
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);

  var infowindow = new google.maps.InfoWindow();
  var marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29)
  });

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
    marker.setIcon(/** @type {google.maps.Icon} */({
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(35, 35)
    }));
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }

    var lon = place.geometry.location.B;
    var lat = place.geometry.location.k;

    document.getElementById('lat').value = lat;
    document.getElementById('lon').value = lon;

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);
  });

  // Sets a listener on a radio button to change the filter type on Places
  // Autocomplete.
  function setupClickListener(id, types) {
    var radioButton = document.getElementById(id);
    google.maps.event.addDomListener(radioButton, 'click', function() {
      autocomplete.setTypes(types);
    });
  }

  setupClickListener('changetype-all', []);
  setupClickListener('changetype-establishment', ['establishment']);
  setupClickListener('changetype-geocode', ['geocode']);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
 <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <?php $this->load->view("partial/sidebar.tpl"); ?>
                <!-- /.sidebar -->
            </aside>

    <!-- Right side column. Contains the navbar and content of the page -->
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                New Location
                <small>Resturant/ Cofee Shop</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Locations</a></li>
                <li class="active">Add New</li>
            </ol>
        </section>

                <!-- Main content -->
                <section class="content">
                    
                      <div class="sucesss_alert_bar alert alert-success bs-alert-old-docs " style="display: none;">
                            <strong>Update</strong>  has been success. 
                        </div>
                    
                    <div class="row">
                        <!-- Location column -->
                        <form role="form" id="form_location" method="POST">
                            <!-- left column -->   
                            <div class="col-md-6">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <div class="box-body">
                                        
                                            <!-- text input -->
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" name="name" class="form-control" value="<?= $location_data->name ?>"  placeholder="New Cofee Ltd"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                               <input type="text" name="description"  value="<?= $location_data->description ?>"  class="form-control" placeholder="We provide tasty coffees"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Geo Address</label> 
                                                <input type="hidden" name="lon" id="lon"/>   
                                                <input type="hidden" name="lat" id="lat"/>                                           
                                            </div>

                                            <input id="pac-input" class="controls" type="text" name="geo_address" placeholder="Location on Google Map">
                                            <div id="map-canvas" style="height:310px;"></div>
                                           
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!--/.col (left) -->

                             <!-- right column -->   
                             <div class="col-md-6">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <div class="box-body">
                                            <div class="form-group">
                                                <label>Contact Number</label>
                                                <input type="text" name="contact_no" class="form-control" value="<?= $location_data->contact_no ?>" placeholder="+44 77756 2335"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Open Hours</label>
                                               <input type="text" name="open_hours" class="form-control"  value="<?= $location_data->open_hours ?>" placeholder="9.00 AM"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Closed Hours</label>
                                               <input type="text" name="closed_hours" class="form-control" value="<?= $location_data->closed_hours ?>"  placeholder="8.00 PM"/>
                                            </div>

                                                <div class="col-xs-6"> 
                                                <label>Saving Up To</label>
                                                </div>
                                                <div class="col-xs-3"><input type="text" size="10" name="saving_price" value="<?= $location_data->saving_upto ?>"  class="form-control" placeholder="$ 10.00"/></div>
                                                <div class="col-xs-3"> <input type="text" size="10" name="saving_percent" value="<?= $location_data->saving_percent ?>"  class="form-control" placeholder="10%"/> </div>
                                             <!-- textarea -->
                                            <div class="form-group">
                                                <label>Display Address</label>
                                                <textarea class="form-control" name="address" rows="3" placeholder="This address will display else where other to finding you in map search">
                                                     <?= $location_data->address ?> 
                                                </textarea>
                                            </div>
                                            <!-- radio -->
                                            <div class="form-group"> 
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="availability" id="availability" value="1" checked>
                                                        Available
                                                    </label>
                                                </div>
                                            </div>  
                                             <div class="form-group"> 
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="featured" id="featured" value="1" >
                                                        Featured
                                                    </label>
                                                </div>
                                            </div>                                  
                                    </div><!-- /.box-body -->
                                    <div class="box-footer">
                                        <input type="hidden" size="10" name="shop_code" value="<?= $location_data->shop_code ?>" />
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div><!-- /.box -->
 
                            </div><!--/.col (right) -->
                        </form>
                    </div>   <!-- /.row -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
<?php $this->load->view("partial/footer.tpl"); ?>
<script src="<?=base_url('assests/js/plugins/jquery_validation/jquery.validate.min.js')?>" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() { 

    $('#form_location').validate({
                errorElement: 'span', 
                errorClass: 'error', 
                focusInvalid: true, 
                rules: {
                    name: {
                        required: true
                    },
                    description: {
                        required: true
                    },
                    google_address : {
                      required: true
                    }
                },

                submitHandler: function (form) {
                     $.ajax({
                          type: "POST",
                          url: "<?php echo base_url('index.php/locations/update'); ?>",
                          data: $('#form_location').serialize(),
                          success: function (data) {
                              //  alert('Data Added');
                               $('.sucesss_alert_bar').css("display", "block" );
                               
                          }
                      });
                }
            }); 

});
</script>