<div class="card card-success card-outline mt-3">

    <div class="card-header ">
        <h3 class="card-title text-success">
            <i class="fas fa-solid fa-plus-minus  mr-2"></i>
            Agregar
        </h3>
    </div>

    <div class="mb-1">

    </div>


    <!-- Main content -->
    <div class="card-body">

        <div class="col-md-7">
            <form method="POST" action="" enctype="multipart/form-data">
                <input type="file" name="archivo" accept="application/pdf">
                <input type="submit" value="Generar resumen">
            </form>
        </div>

    </div>

    <body>
        <h1>Resumen generado</h1>
        <p><?php echo $summary; ?></p>
    </body>

</div>