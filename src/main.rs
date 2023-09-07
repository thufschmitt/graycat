use image2::*;

fn main() -> Result<(), Error> {
    let image = Image::<f32, image2::Rgb>::open("in.jpg")?;
    let conv = filter::convert();
    let dest: Image<f32, Gray> = image.run(conv, None);
    dest.save("out.jpg")?;

    Ok(())
}
