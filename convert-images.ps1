$tesseract = "c:\program files\tesseract-ocr\"

$files = ls "./membership roll" -File

foreach ($file in $files) {
    $basename = $file.BaseName
    & $tesseract/tesseract.exe $file.FullName ./output/$basename
    & $tesseract/tesseract.exe $file.FullName ./output/$basename -l eng pdf
}