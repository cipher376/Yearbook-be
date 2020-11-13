const sharp = require('sharp');
const smartcrop = require('smartcrop-sharp');
const resizeOptimizeImages = require('resize-optimize-images');
const Thumbler = require('thumbler');


// finds the best crop of src and writes the cropped and resized image to dest.
export function applySmartCrop(src: string, dest: string, width: number, height: number) {
  return smartcrop.crop(src, {width: width, height: height})
    .then(function (result: any) {
      const crop = result.topCrop;
      return sharp(src)
        .extract({width: crop.width, height: crop.height, left: crop.x, top: crop.y})
        .resize(width, height)
        .toFile(dest);
    })
}

export async function resizeImage(src: string, width: number, quality = 90) {
  // Set the options.
  const options = {
    images: [src],
    width,
    quality
  };

  // Run the module.
  return resizeOptimizeImages(options);
}

export async function createVideoThumbnail(src: string, dst: string, size = '300x200', time = '00:00:02') {
  return Thumbler({
    type: 'video',
    input: src,
    output: dst,
    time,
    size // this optional if null will use the desimention of the video
  }, function (err: any, path: any) {
    if (err) return err;
    return path;
  });
}
export async function createImageThumbnail(src: string, dst: string, size = '200x200') {
  return Thumbler({
    type: 'image',
    input: src,
    output: dst,
    size // this optional if null will use the dimension of the image
  }, function (err: any, path: any) {
    if (err) return err;
    return path;
  });
}

export async function createVideoPoster(src: string, dst: string, size = '1200x628') {
  return createVideoThumbnail(src, dst, size)
}
