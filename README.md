# CHILD: The Channel-Hillslope Integrated Landscape Development

This fork of [CHILD](https://github.com/childmodel/child) was used in the work of Rongier & Peeters ([10.1029/2021WR030963](https://doi.org/10.1029/2021WR030963)) and includes some modifications to avoid crashes when using the stream meander module. It has a simplified organization and files that were unnecessary for this specific project have been removed, including the post-processing files. Post-processing was instead done using the Python package [pyrunchild](https://github.com/grongier/pyrunchild).

## Installation

Precompiled executables are provided in the folders [bin/windows](bin/windows), [bin/linux](bin/linux), and [bin/osx](bin/osx). If those don't work, you can use the makefile in the root directory, which will compile the source code from the folder *src* and create a new executable in the folder [bin](bin).

## Use

You can then run CHILD using the following command line:

    child [input file]

You can find some examples of input files in the folder [examples](examples). For more information, see the [user guide](doc/child_users_guide.pdf) in the folder [doc](doc).

## Citation

If you use this version of CHILD in your research, please cite the original article describing CHILD:

> Tucker G., Lancaster S., Gasparini N., Bras R. (2001) The Channel-Hillslope Integrated Landscape Development Model (CHILD). In: Harmon R.S., Doe W.W. (eds) Landscape Erosion and Evolution Modeling. Springer, Boston, MA. https://doi.org/10.1007/978-1-4615-0575-4_12

Here is the corresponding BibTex entry if you use LaTex:

    @incollection{Tucker2001,
        author = "Tucker, Gregory and Lancaster, Stephen and Gasparini, Nicole and Bras, Rafael",
        editor = "Harmon, Russell S. and Doe, William W.",
        title = "The Channel-Hillslope Integrated Landscape Development Model (CHILD)",
        booktitle = "Landscape Erosion and Evolution Modeling",
        year = "2001",
        publisher = "Springer US",
        address = "Boston, MA",
        pages = "349--388",
        isbn = "978-1-4615-0575-4",
        doi = "10.1007/978-1-4615-0575-4\{_}12"
    }
