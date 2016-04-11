# abigail's puppet files

Dependencies:

* `puppet`
* `librarian-puppet`

To configure the system, as root, run:

    librarian-puppet install
    puppet apply --modulepath=modules/ manifests/

This will automatically install this repository into `/usr/local/share/puppet`
and add an `anacron` job to regularly apply it. You can now delete the
directory to which you cloned this repository.
