<?php $this->load->view("partial/header.tpl"); ?>

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
                Plan Information 
                <small>Add new plan</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Plans</a></li>
                <li class="active">Add New</li>
            </ol>
        </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                    
                        <div class="insert_alert_bar alert alert-success bs-alert-old-docs " style="display: none;">
                            <strong>Data added </strong>  has been success. 
                        </div>
                        
                        <!-- Location column -->
                        <form role="form" id="form_item">
                            <!-- left column -->   
                            <div class="col-md-6">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <div class="box-body">
                                        
 

                                            <!-- text input -->
                                            <div class="form-group">
                                                <label> Name</label>
                                                <input type="text" name="name" class="form-control" value="<?php  if(isset($itemData->name)){ echo $itemData->name;} ?>" placeholder="New Cofee Ltd"/>
                                            </div>
                                            <div class="form-group">
                                                <label> Description</label>
                                                <textarea class="form-control" name="description" rows="3" placeholder="Tasty cofee ups for affordable price">
                                                     
                                                </textarea>
                                            </div>


                                            <div class="col-xs-4"> 
                                            <label>Inventory</label>
                                            </div>
                                                <div class="col-xs-4"><input type="text" size="10" name="quantity" value=" " class="form-control" placeholder="# Quantity"/></div>
                                                 
                                            <br/>
                    

                                            <div class="form-group">
                                                <label>Price</label>
                                               <input type="text" name="price" class="form-control col-xs-4"  value="" placeholder="£ 10.00"/>
                                            </div>
                    
 
                                            <br/><br/>
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div><!--/.col (left) -->

                             <!-- right column -->   
                             <div class="col-md-6">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <div class="box-body">
                                        
                                        <div class="form-group">
                                                <label>frequency</label>
                                               <input type="text" name="frequency" class="form-control col-xs-4"  value="" />
                                            </div>

                                            <div class="form-group">
                                                <label>Start Date</label>
                                               <input type="text" id=""  name="start_date" class="form-control col-xs-4 setData"  value="" />
                                            </div>

                                            <div class="form-group">
                                                <label>End Date</label>
                                               <input type="text" name="end_date" class="form-control col-xs-4 setData"  value="" />
                                            </div>
                                            
                                          
                                        
                                            <div class="form-group">
                                                <label> Items </label>
                                               
                                                <select name="items[]" class="form-control" multiple="multiple">
                                                    <?php foreach($items as $key => $value){ ?>
                                                        <option value="<?= $value['item_code']?> "><?= $value['name']?></option>
                                                    <?php } ?>
                                                </select>
                                                
                                            </div>
                                        
                                        
                                    </div><!-- /.box-body -->
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div><!-- /.box -->

                            </div>
                             <!--/.col (right) -->
                        </form>
                    </div>   <!-- /.row -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

<?php $this->load->view("partial/footer.tpl"); ?>

<!-- Jquery Form Validation-->
<script src="<?=base_url('assests/js/plugins/jquery_validation/jquery.validate.min.js')?>" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() { 

    $('#form_item').validate({
                errorElement: 'span', 
                errorClass: 'error', 
                focusInvalid: true, 
                rules: {
                    name: {
                        required: true
                    },
                    quantity: {
                        required: true
                    },
                    price: {
                        required: true
                    }
                },

                submitHandler: function (form) {
                     $.ajax({
                          type: "POST",
                          url: "<?php echo base_url('index.php/plans/save'); ?>",
                          data: $('#form_item').serialize(),
                          success: function (data) {
                                //alert('Data Added');
                                $('.insert_alert_bar').css("display","block");
                                setInterval("location.reload();", 1500);
                          }
                      });
                }
            }); 
});
</script>

<!-- Simple Ajax Uploader -->
<script type="text/javascript" src="<?=base_url('assests/js/SimpleAjaxUploader.js')?>"></script>
<script>
function safe_tags( str ) {
  return String( str )
           .replace( /&/g, '&amp;' )
           .replace( /"/g, '&quot;' )
           .replace( /'/g, '&#39;' )
           .replace( /</g, '&lt;' )
           .replace( />/g, '&gt;' );
}

window.onload = function() {
  
  var btn = document.getElementById('upload-btn'),
  wrap = document.getElementById('pic-progress-wrap'),
  picBox = document.getElementById('picbox'),
  errBox = document.getElementById('errormsg');
  var uploader = new ss.SimpleUpload({
        button: btn,
        url: "<?php echo base_url('index.php/items/upload_item_image'); ?>",
        progressUrl: 'extras/uploadProgress.php',
        name: 'imgfile',
        multiple: true,
        maxUploads: 2,
        maxSize: 500,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
        accept: 'image/*',
        hoverClass: 'btn-hover',
        focusClass: 'active',
        disabledClass: 'disabled',
        responseType: 'json',
        onExtError: function(filename, extension) {
          alert(filename + ' is not a permitted file type.'+"\n\n"+'Only PNG, JPG, and GIF files are allowed in the demo.');
        },
        onSizeError: function(filename, fileSize) {
          alert(filename + ' is too big. (500K max file size)');
        },        
        onSubmit: function(filename, ext) {            
           var prog = document.createElement('div'),
               outer = document.createElement('div'),
               bar = document.createElement('div'),
               size = document.createElement('div');
                       
            prog.className = 'prog';
            size.className = 'size';
            outer.className = 'progress progress-striped active';
            bar.className = 'progress-bar progress-bar-success';
            
            outer.appendChild(bar);
            prog.innerHTML = '<span style="vertical-align:middle;">'+safe_tags(filename)+' - </span>';
            prog.appendChild(size);
            prog.appendChild(outer);
            wrap.appendChild(prog); // 'wrap' is an element on the page
            
            this.setProgressBar(bar);
            this.setProgressContainer(prog);
            this.setFileSizeBox(size);      
            
            errBox.innerHTML = '';
            btn.value = 'Choose another file';
          },    
        startXHR: function() {
          // Dynamically add a "Cancel" button to be displayed when upload begins
          // By doing it here ensures that it will only be added in browses which 
          // support cancelling uploads
          var abort = document.createElement('button');
            
            wrap.appendChild(abort);
            abort.className = 'btn btn-sm btn-info';
            abort.innerHTML = 'Cancel';

            // Adds click event listener that will cancel the upload
            // The second argument is whether the button should be removed after the upload
            // true = yes, remove abort button after upload
            // false/default = do not remove
            this.setAbortBtn(abort, true);              
        },          
        onComplete: function(filename, response) {
            if (!response) {
              errBox.innerHTML = 'Unable to upload file';
              return;
            }     
            if (response.success === true) {

                picBox.innerHTML += '<input type="hidden" name="item_images[]" value="' + encodeURIComponent(response.fileName) + '">';
                picBox.innerHTML += '<img src="<?=base_url("mythumb.php?file=")?>' + encodeURIComponent(response.file) + '&width=100&height=100">';

                
            } else {
              if (response.msg)  {
                errBox.innerHTML = response.msg;
              } else {
                errBox.innerHTML = 'Unable to upload file';
              }
            }

          }
  });
};
</script> 

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> 
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> 

<script type="text/javascript">
 
    $(function() {
            $(".setData").datepicker({
                dateFormat : 'mm/dd/yy',
                changeMonth : true,
                changeYear : true,
                yearRange: '-100y:c+nn',
                maxDate: '-1d'
            });
        });
        
</script>