                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="<?=base_url('assests/img/avatar3.png')?>" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello, <?=$user_info->first_name?></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
<!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">                        

                        <li class="active">
                            <a href="<?=base_url()?>">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        
                             
                        <?php
                        
                        foreach($allowed_modules as $key => $pmodule)
                        {

                            $modname = $this->lang->line("module_".$pmodule->parent['module_id']);
                            $modname = str_replace(" ",'',$modname);
                        ?>

                            <?php if (count($pmodule->childModules)) { 
                            ?>                              
                            <li class="treeview">
                                <a href="#">
                                    <i class="fa fa-edit"></i> <span><?=$modname?></span>
                                    <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                    <ul class="treeview-menu">
                                       
                                        <?php 
                                        foreach($pmodule->childModules as  $module)
                                        {
                                            $modname = $this->lang->line($pmodule->parent['module_id']."_".$module['module_id']);
                                            $modname = str_replace(" ",'',$modname);
                                        ?>
                                            <li><a href="<?=base_url('index.php/'.$pmodule->parent['module_id'].'/'.$module['module_id'].'')?>"><i class="fa fa-angle-double-right"></i><?=$modname?></a></li>
                                        <?php }?>
                                        
                                   
                                        
                                    </ul>
                             </li>
                           <?php }else{?>
                                <li><a href="<?=base_url('index.php/'.$pmodule->parent['module_id'].'')?>"><i class="fa fa-angle-double-right"></i><?=$modname?></a>
                              </li>
                            <?php }?>
                       
                        <?php }?>
                        <!-- <li class="treeview">
                            <a href="#">
                                <i class="fa fa-table"></i> <span>Tables</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/tables/simple.html"><i class="fa fa-angle-double-right"></i> Simple tables</a></li>
                                <li><a href="pages/tables/data.html"><i class="fa fa-angle-double-right"></i> Data tables</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="pages/calendar.html">
                                <i class="fa fa-calendar"></i> <span>Calendar</span>
                                <small class="badge pull-right bg-red">3</small>
                            </a>
                        </li>
                        <li>
                            <a href="pages/mailbox.html">
                                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                                <small class="badge pull-right bg-yellow">12</small>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-folder"></i> <span>Examples</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/examples/invoice.html"><i class="fa fa-angle-double-right"></i> Invoice</a></li>
                                <li><a href="pages/examples/login.html"><i class="fa fa-angle-double-right"></i> Login</a></li>
                                <li><a href="pages/examples/register.html"><i class="fa fa-angle-double-right"></i> Register</a></li>
                                <li><a href="pages/examples/lockscreen.html"><i class="fa fa-angle-double-right"></i> Lockscreen</a></li>
                                <li><a href="pages/examples/404.html"><i class="fa fa-angle-double-right"></i> 404 Error</a></li>
                                <li><a href="pages/examples/500.html"><i class="fa fa-angle-double-right"></i> 500 Error</a></li>
                                <li><a href="pages/examples/blank.html"><i class="fa fa-angle-double-right"></i> Blank Page</a></li>
                            </ul>
                        </li> -->
                    </ul>
    </section>