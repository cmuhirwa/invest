<div id="header" class="header">
    <!-- MAIN HEADER -->
    <div class="main-header">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 logo">
                    <a href="#"><img alt="Cavada market" src="assets/images/logo9.png" /></a>
                </div>
                <div class="tool-header">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 header-search">
                        <span class="toggle-icon"></span>
                        <form class="form-search toggle-mobile">
                            <div class="input-search">
                                <input type="text"  placeholder="Search everything">
                            </div>
							
                            <div class="form-category dropdown">
							<?php
								include ("db.php");
								$sql1 = $db->query("SELECT * FROM `productcategory`");
								echo'<select class="box-category">';
								while($row = mysqli_fetch_array($sql1)){
									$CatID = $row['catId'];
									echo'<optgroup label="'.$row['catNane'].'"><option>All Category</option>';
									$sql2 = $db->query("SELECT * FROM productsubcategory WHERE CatCode='$CatID'");
									while($row = mysqli_fetch_array($sql2))
									{
										$subCatId = $row['subCatId'];
										echo'<option>'.$row['subCatName'].'</option>';
										$sql3 = $db->query("SELECT * FROM products WHERE subCatCode='$subCatId'");
										while($row = mysqli_fetch_array($sql3)){
											echo'<li>'.$row['productName'].'</li>';
											}
										echo'</ul></li>';
									}
										echo'</optgroup>';
								}
								echo'</select>';

							?>
                            </div>
                            <button type="submit" class="btn-search"></button>
                        </form>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 right-main-header">
                        
                        <div class="action">
                            <a title="Login" class="compare fa fa-user" href="admin/login.php"></a>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
 </div>