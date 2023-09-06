use std::error::Error;
use serde::Deserialize;
use magick_rust::{MagickWand, magick_wand_genesis};
use magick_rust::bindings::ImageType_GrayscaleType;

#[derive(Deserialize)]
pub struct Cat {
    pub url: String
}

fn main() -> Result<(), Box<dyn Error>> {
    magick_wand_genesis();
    let mut wand = MagickWand::new();
    let cats = reqwest::blocking::get("https://api.thecatapi.com/v1/images/search")?
        .json::<Vec<Cat>>()?;
    let cat_blob = reqwest::blocking::get(&cats[0].url)?
        .bytes()?;
    wand.read_image_blob(cat_blob)?;
    wand.set_image_type(ImageType_GrayscaleType)?;
    wand.write_image("cat.jpg")?;
    Ok(())
}
