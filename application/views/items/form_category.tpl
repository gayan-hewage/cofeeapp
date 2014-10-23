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
                Item Categories
                <small>Add new store Item</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Items</a></li>
                <li class="active">Add New</li>
            </ol>
        </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- Location column -->
                        <form role="form" id="form_category">
                            <!-- left column -->   
                            <div class="col-md-6">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <div class="box-body">
                                        

                                            <div class="form-group">
                                                <label>Category Name</label>
                                               <input type="text" name="category_name" class="form-control" value="" />
                                            </div>

                                            <div class="form-group">
                                                <label>Category Description</label>
                                               <input type="text" name="category_description" class="form-control" value="" />
                                            </div>

                                            <div class="form-group">
                                                <label>Parent Category</label>
                                                <select class="form-control" name="parent_category">
                                                <option value="">--Select--</option>
                                                <?php foreach ($categories as $key => $value) {?>
                                                    <option value="<?=$value['id']?>_<?=$value['category_name']?>"><?=$value['category_name']?></option>
                                                <?php }?>
                                                </select>
                                            </div>                                            

                                            <!-- text input -->
                                             <div class="form-group"> 
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="status" id="status" value="1" >
                                                        Enabled
                                                    </label>
                                                </div>
                                            </div>  

                                            <div class="col-xs-4"> 
                                            <label>Saving Up To</label>
                                            </div>
                                                <div class="col-xs-4"><input type="text" size="10" name="saving_upto" class="form-control" placeholder="10.00"/></div>

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
                                                <label>Item Images</label>
                                                <div class="col-md-12">
                                                      <div class="content-box">
                                                        <div class="clear">           
                                                          <input type="button" id="upload-btn" class="btn btn-primary btn-large clearfix" value="Choose file">
                                                          <span style="padding-left:5px;vertical-align:middle;"><i>PNG, JPG, or GIF (500K max file size)</i></span>
                                                          <div id="errormsg" class="clearfix redtext">
                                                          </div>                
                                                          <div id="pic-progress-wrap" class="progress-wrap" style="margin-top:10px;margin-bottom:10px;">
                                                          </div>  
                                                          
                                                          <div id="picbox" class="clear" style="padding-top:0px;padding-bottom:10px;">
                                                          </div>

                                                        </div>
                                                      </div>  
                                                    </div>
                                            </div>                
                                    </div><!-- /.box-body -->
                                    <div class="box-footer">
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

<!-- Jquery Form Validation-->
<script src="<?=base_url('assests/js/plugins/jquery_validation/jquery.validate.min.js')?>" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() { 

    $('#form_category').validate({
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
                    reorder_level : {
                      required: true
                    },
                    price: {
                        required: true
                    },
                    category : {
                        required: true
                    }
                },

                submitHandler: function (form) {
                     $.ajax({
                          type: "POST",
                          url: "<?php echo base_url('index.php/items/category_save'); ?>",
                          data: $('#form_category').serialize(),
                          success: function (data) {
                                alert('Data Added');
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