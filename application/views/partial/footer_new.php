                       </div>   
                       <!-- END innerpage content -->   
                </div>
                <!-- END Page Content -->

    
    
     <!-- Footer -->
                <footer>
                    <span id="year-copy"></span> &copy; <strong>uAdmin 1.3</strong> - Crafted with <i class="icon-heart"></i> by <strong><a href="http://goo.gl/vNS3I" target="_blank">pixelcave</a></strong>
                </footer>
                <!-- END Footer -->
            </div>
            <!-- END Inner Container -->
        </div>
        <!-- END Page Container -->

        <!-- Scroll to top link, check main.js - scrollToTop() -->
        <a href="#" id="to-top"><i class="icon-chevron-up"></i></a>

        <!-- User Modal Settings, appears when clicking on 'User Settings' link found on user dropdown menu (header, top right) -->
        <div id="modal-user-settings" class="modal hide">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4>Profile Settings</h4>
            </div>
            <!-- END Modal Header -->

            <!-- Modal Content -->
            <div class="modal-body">
                <!-- Example Tabs, initialized at main.js - uiDemo() -->
                <!-- Tab links -->
                <ul id="example-user-tabs" class="nav nav-tabs">
                    <li class="active"><a href="#example-user-tabs-account"><i class="icon-cogs"></i> Account</a></li>
                    <li><a href="#example-user-tabs-profile"><i class="icon-user"></i> Profile</a></li>
                </ul>
                <!-- END Tab links -->

                <!-- END Tab Content -->
                <div class="tab-content">
                    <!-- First Tab -->
                    <div class="tab-pane active" id="example-user-tabs-account">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <strong>Success!</strong> Password changed!
                        </div>
                        <form class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label" for="example-user-username">Username</label>
                                <div class="controls">
                                    <input type="text" id="example-user-username" class="disabled" value="administrator" disabled="">
                                    <span class="help-block">You can't change your username!</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-pass">Password</label>
                                <div class="controls">
                                    <input type="password" id="example-user-pass">
                                    <span class="help-block">if you want to change your password enter your current for confirmation!</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-newpass">New Password</label>
                                <div class="controls">
                                    <input type="password" id="example-user-newpass">
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- END First Tab -->

                    <!-- Second Tab -->
                    <div class="tab-pane" id="example-user-tabs-profile">
                        <h5 class="page-header-sub hidden-phone">Image</h5>
                        <div class="form-horizontal hidden-phone">
                            <div class="control-group">
                                <img src="img/placeholders/image_dark_120x120.png" alt="image">
                            </div>
                            <div class="control-group">
                                <form action="index.html" class="dropzone">
                                    <div class="fallback">
                                        <input name="file" type="file">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <form class="form-horizontal">
                            <h5 class="page-header-sub">Details</h5>
                            <div class="control-group">
                                <label class="control-label" for="example-user-firstname">Firstname</label>
                                <div class="controls">
                                    <input type="text" id="example-user-firstname" value="John">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-lastname">Lastname</label>
                                <div class="controls">
                                    <input type="text" id="example-user-lastname" value="Doe">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-gender">Gender</label>
                                <div class="controls">
                                    <select id="example-user-gender">
                                        <option>Male</option>
                                        <option>Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-birthdate">Birthdate</label>
                                <div class="controls">
                                    <div class="input-append">
                                        <input type="text" id="example-user-birthdate" class="input-small input-datepicker">
                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-skills">Skills</label>
                                <div class="controls">
                                    <select id="example-user-skills" multiple="multiple" class="select-chosen">
                                        <option selected>html</option>
                                        <option selected>css</option>
                                        <option>javascript</option>
                                        <option>php</option>
                                        <option>mysql</option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-bio">Bio</label>
                                <div class="controls">
                                    <textarea id="example-user-bio" class="textarea-elastic" rows="3">Bio Information..</textarea>
                                </div>
                            </div>
                            <h5 class="page-header-sub">Social</h5>
                            <div class="control-group">
                                <label class="control-label" for="example-user-fb">Facebook</label>
                                <div class="controls">
                                    <div class="input-append">
                                        <input type="text" id="example-user-fb">
                                        <span class="add-on"><i class="icon-facebook"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-twitter">Twitter</label>
                                <div class="controls">
                                    <div class="input-append">
                                        <input type="text" id="example-user-twitter">
                                        <span class="add-on"><i class="icon-twitter"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-pinterest">Pinterest</label>
                                <div class="controls">
                                    <div class="input-append">
                                        <input type="text" id="example-user-pinterest">
                                        <span class="add-on"><i class="icon-pinterest"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="example-user-github">Github</label>
                                <div class="controls">
                                    <div class="input-append">
                                        <input type="text" id="example-user-github">
                                        <span class="add-on"><i class="icon-github"></i></span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- END Second Tab -->
                </div>
                <!-- END Tab Content -->
            </div>
            <!-- END Modal Content -->

            <!-- Modal footer -->
            <div class="modal-footer">
                <button class="btn btn-danger" data-dismiss="modal"><i class="icon-remove"></i> Close</button>
                <button class="btn btn-success"><i class="icon-spinner icon-spin"></i> Save changes</button>
            </div>
            <!-- END Modal footer -->
        </div>
        <!-- END User Modal Settings -->

        <!-- Excanvas for Flot (Charts plugin) support on IE8 -->
        <!--[if lte IE 8]><script src="js/helpers/excanvas.min.js"></script><![endif]-->

       

        <!-- Bootstrap.js -->
        <script src="js/vendor/bootstrap.min.js"></script>

        <!--
        Include Google Maps API for global use.
        If you don't want to use  Google Maps API globally, just remove this line and the gmaps.js plugin from js/plugins.js (you can put it in a seperate file)
        Then iclude them both in the pages you would like to use the google maps functionality
        -->
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>

        <!-- Jquery plugins and custom javascript code -->
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        <!-- Javascript code only for this page -->
        <script>
            $(function() {
                // Initialize dash Datatables
                $('#dash-example-orders').dataTable({
                    "aoColumnDefs": [{"bSortable": false, "aTargets": [0]}],
                    "iDisplayLength": 6,
                    "aLengthMenu": [[6, 10, 30, -1], [6, 10, 30, "All"]]
                });

                // Dash example stats
                var dashChart = $('#dash-example-stats');

                var dashChartData1 = [
                    [0, 200],
                    [1, 250],
                    [2, 360],
                    [3, 584],
                    [4, 1250],
                    [5, 1100],
                    [6, 1500],
                    [7, 1521],
                    [8, 1600],
                    [9, 1658],
                    [10, 1623],
                    [11, 1900],
                    [12, 2100],
                    [13, 1700],
                    [14, 1620],
                    [15, 1820],
                    [16, 1950],
                    [17, 2220],
                    [18, 1951],
                    [19, 2152],
                    [20, 2300],
                    [21, 2325],
                    [22, 2200],
                    [23, 2156],
                    [24, 2350],
                    [25, 2420],
                    [26, 2480],
                    [27, 2320],
                    [28, 2380],
                    [29, 2520],
                    [30, 2590]
                ];
                var dashChartData2 = [
                    [0, 50],
                    [1, 180],
                    [2, 200],
                    [3, 350],
                    [4, 700],
                    [5, 650],
                    [6, 700],
                    [7, 780],
                    [8, 820],
                    [9, 880],
                    [10, 1200],
                    [11, 1250],
                    [12, 1500],
                    [13, 1195],
                    [14, 1300],
                    [15, 1350],
                    [16, 1460],
                    [17, 1680],
                    [18, 1368],
                    [19, 1589],
                    [20, 1780],
                    [21, 2100],
                    [22, 1962],
                    [23, 1952],
                    [24, 2110],
                    [25, 2260],
                    [26, 2298],
                    [27, 1985],
                    [28, 2252],
                    [29, 2300],
                    [30, 2450]
                ];

                // Initialize Chart
                $.plot(dashChart, [
                    {data: dashChartData1, lines: {show: true, fill: true, fillColor: {colors: [{opacity: 0.05}, {opacity: 0.05}]}}, points: {show: true}, label: 'All Visits'},
                    {data: dashChartData2, lines: {show: true, fill: true, fillColor: {colors: [{opacity: 0.05}, {opacity: 0.05}]}}, points: {show: true}, label: 'Unique Visits'}],
                {
                    legend: {
                        position: 'nw',
                        backgroundColor: '#f6f6f6',
                        backgroundOpacity: 0.8
                    },
                    colors: ['#555555', '#db4a39'],
                    grid: {
                        borderColor: '#cccccc',
                        color: '#999999',
                        labelMargin: 5,
                        hoverable: true,
                        clickable: true
                    },
                    yaxis: {
                        ticks: 5
                    },
                    xaxis: {
                        tickSize: 2
                    }
                }
                );

                // Create and bind tooltip
                var previousPoint = null;
                dashChart.bind("plothover", function(event, pos, item) {

                    $("#x").text(pos.x.toFixed(2));
                    $("#y").text(pos.y.toFixed(2));

                    if (item) {
                        if (previousPoint !== item.dataIndex) {
                            previousPoint = item.dataIndex;

                            $("#tooltip").remove();
                            var x = item.datapoint[0],
                                y = item.datapoint[1];

                            $('<div id="tooltip" class="chart-tooltip"><strong>' + y + '</strong> visits</div>')
                                .css({top: item.pageY - 30, left: item.pageX + 5})
                                .appendTo("body")
                                .show();
                        }
                    }
                    else {
                        $("#tooltip").remove();
                        previousPoint = null;
                    }
                });
            });
        </script>

    </body>
</html>