<section class="content-header">
    <h1><?php echo $gsprache->fastdownload;?></h1>
    <ol class="breadcrumb">
        <li><a href="userpanel.php"><i class="fa fa-home"></i> Home</a></li>
        <li><a href="userpanel.php?w=gs"><?php echo $gsprache->gameserver;?></a></li>
        <li><?php echo $gsprache->fastdownload;?></li>
        <li class="active"><?php echo $serverip.':'.$port;?></li>
    </ol>
</section>

<!-- Main Content -->
<section class="content">

    <div class="row hidden-xs">
        <div class="col-md-12">
            <div class="alert alert-info alert-dismissable">
                <i class="fa fa-info"></i>
                <?php echo $sprache->help_fdl;?>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-body">
                    <?php if (count($errors)>0){ ?>
                    <div class="alert alert-error">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <h4><?php echo $gsprache->errors;?></h4>
                        <?php echo implode(', ',$errors);?>
                    </div>
                    <?php }?>

                    <form role="form" action="userpanel.php?w=fd&amp;d=es&amp;id=<?php echo $id;?>&amp;r=fd" onsubmit="return confirm('<?php echo $gsprache->sure;?>');" method="post">

                        <input type="hidden" name="action" value="md">

                        <div class="form-group">
                            <label for="inputFLD"><?php echo $sprache->haupt2;?></label>

                            <select class="form-control" id="inputFLD" name="masterfdl" onchange="SwitchShowHideRows('details');">
                                <option value="Y"><?php echo $gsprache->yes;?></option>
                                <option value="N" <?php if ($masterfdl=="N") echo 'selected="selected"'; ?>><?php echo $gsprache->no;?></option>
                            </select>
                        </div>

                        <div class="N switch <?php if ($masterfdl=='Y') echo 'display_none'; ?> form-group<?php if(isset($errors['ftp_adresse'])) echo ' error';?>">
                            <label for="input_ftp_adresse"><?php echo $gameSprache->ftp_adresse;?></label>
                            <input class="form-control"  id="input_ftp_adresse" type="text" name="ftp_adresse" value="<?php echo $ftp_adresse;?>" required>
                        </div>

                        <div class="N <?php if ($masterfdl=='Y') echo 'display_none'; ?> switch form-group<?php if(isset($errors['ftp_port'])) echo ' error';?>">
                            <label for="input_ftp_port"><?php echo $gameSprache->ftp_port;?></label>
                            <input class="form-control"  id="input_ftp_port" type="text" name="ftp_port" value="<?php echo $ftp_port;?>" required>
                        </div>

                        <div class="N <?php if ($masterfdl=='Y') echo 'display_none'; ?> switch form-group<?php if(isset($errors['ftp_user'])) echo ' error';?>">
                            <label for="input_ftp_user"><?php echo $gameSprache->ftp_user;?></label>
                            <input class="form-control"  id="input_ftp_port" type="text" name="ftp_user" value="<?php echo $ftp_user;?>" required>
                        </div>

                        <div class="N <?php if ($masterfdl=='Y') echo 'display_none'; ?> switch form-group<?php if(isset($errors['ftp_password'])) echo ' error';?>">
                            <label for="input_ftp_password"><?php echo $gameSprache->ftp_password;?></label>
                            <input class="form-control"  id="input_ftp_port" type="text" name="ftp_password" value="<?php echo $ftp_password;?>" required>
                        </div>

                        <div class="N <?php if ($masterfdl=='Y') echo 'display_none'; ?> switch form-group">
                            <label for="input_ftp_path"><?php echo $gameSprache->ftp_path;?></label>
                            <input class="form-control"  id="input_ftp_port" type="text" name="ftp_path" value="<?php echo $ftp_path;?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="inputEdit"></label>
                            <button class="btn btn-primary" id="inputEdit" type="submit"><i class="icon-edit icon-white"></i> <?php echo $gsprache->save;?></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>


<script type="text/javascript">
    window.onDomReady = initReady;

    function initReady(fn) {
        if(document.addEventListener) {
            document.addEventListener("DOMContentLoaded", fn, false);
        } else {
            document.onreadystatechange = function() {
                readyState(fn);
            }
        }
    }

    function readyState(func) {
        if(document.readyState == "interactive" || document.readyState == "complete") {
            func();
        }
    }

    window.onDomReady(onReady); function onReady() {
        SwitchShowHideRows('init_ready');
    }
</script>