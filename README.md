DICOM Explorer
==============

Simple docker image to process a single DICOM file.

Usage:
```bash
make
docker run --rm -i ne-dicom-explorer [commands...] < file.dcm
```

Where the `commands` arguments are one or more of the following:
- `summary` (default) - output summary of the file
- `print` - output details of the file
- `image` - display the image (needs X11 forwarding)

**Convenience**

To reduce typing define a function, e.g. `dcx`, somewhere in your shell startup files (~/.bashrc maybe):

```bash
function dcx() {
  docker run \
    --rm \
    --interactive \
    --env DISPLAY=host.docker.internal:0 ne-dicom-explorer \
    "$@"
}
```

Then run that function with the commands and file as standard input:

```bash
# Show summary
dcx summary < file.dcm
# Summary is default
dcx < file.dcm
# Print full DICOM data
dcx print < file.dcm
# Show image
dcx image < file.dcm
# Show summary, full info, and image
dcx summary print image < file.dcm
```

X11 Forwarding
--------------

*MacOS*

1. Install XQuartz
2. Start XQuartz and change preferences to allow network connections.
3. Restart XQuartz
4. Run `xhost +localhost`
5. Run `docker run --rm -i -e DISPLAY=host.docker.internal:0 ne-dicom-explorer image < file.dcm`
