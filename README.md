# abigail's puppet files

Dependencies:

* `puppet`
* `librarian-puppet`

To configure the system, as root, run:

    librarian-puppet install
    puppet apply --modulepath=modules/ manifests/
