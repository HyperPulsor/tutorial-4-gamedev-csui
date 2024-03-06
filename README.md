# Tutorial Game Development
## Authors

* **Rakan Fasya Athhar Rayyan** - *2106750950*

## Tutorial 4

#### Pengerjaan Level Baru :

- **Tilemap dan Spawner**, Pada level baru ini proses pembuatan tilemap dan spawner sama dengan yang diberikan pada tutorial. Akan tetapi, akan dibuat tilemap baru `sand_tileset.tres` dengan spreadsheet yang digunakan dan scene yang digunakan sebagai objek spawner, itu berbeda. Spreadsheet yang digunakan adalah `spritesheet_gr_sand.png`. Lalu, untuk objek spawner yang digunakan adalah dari scene `FallingSaw.tscn` dan `FallingBernacle.tscn`. Masing-masing dari objek ini memiliki waktu timer yang berbeda berdasarkan variabel `timer_duration` yang diset dari inspector. Setiap objek spawner juga memiliki bentuk collision dan sprite yang berbeda.<br></br>
![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/079f3bf5-dbf5-446b-b7b7-eab6b93b6f6d)
![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/025f9330-bdad-46c3-82b2-9535beecbd76)
![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/cc37d1c5-c717-4d63-980d-2819f2798e02)

- **HP and Save System**, sebagai *polishing* dari level ditambahkan sistem HP yang dimana karakter maksimal 2 kali berkolisi dengan objek spawner sebelum masuk ke layar game over. Hal ini ditunjukkan dengan adanya variabel `health` yang menandakan jumlah nyawa yang dimiliki pemain (tidak mempengaruhi pemain apabila jatuh). Ditambahkan sprite `Heart` untuk representasi nyawa pemain sebagai HUD yang menjadi child dari node `Camera2D`. Apabila pemain terkena damage, texture dari Sprite akan diubah menjadi `hudHeart_half.png`<br></br>
![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/3f91b108-d8ae-43dc-ad86-b845dfd9867b)
![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/dfc90730-e047-472f-baf3-d39be868e179)
![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/f691b260-ede4-4f47-9496-1c30e0d3831f)

    Terdapat fungsi `damaged()` yang mengurangi jumlah nyawa apabila berkolisi dengan objek spawner dan juga mengubah texture sprite dari representasi nyawa pemain. Fungsi ini dipanggil pada signal yang menunjukkan bahwa player berkolisi dengan objek spawner. Mengambil objek Player dari body, apabila nyawa sudah habis, maka akan berpindah ke Scene `LoseScreen`. Jika belum, maka akan memanggil fungsi `damaged()`.<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/137977e6-41eb-4d0e-8fbd-4baa1f23d85d)<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/ea23f149-e5db-45ff-9946-bcfeffaa6b6e)<br></br>

    Untuk memungkinkan data nyawa pemain disimpan di scene selanjutnya, diperlukan adanya **Save System**. Tambah script baru yang bernama `save_file.gd` yang berfungsi sebagai script *save* dan *load* data. Terdapat variabel konstan `SAVE_FILE` yang berisikan path penyimpanan data. Lalu, terdapat `g_data` yang merupakan *dictionary* yang berfungsi untuk menyimpan value sebenarnya. Pertama, terdapat *function* `save_data()`. Pada fungsi ini, dibuat objek file baru dan dibuka file pada path milik variabel `SAVE_FILE` dengan metode *write* (untuk membuat file save baru), setelah itu ditutup. **Kedua**, fungsi `load_data()`. Pada fungsi ini, akan dicek apakah data sudah tersimpan pada path `SAVE_FILE`, jika belum ada akan dimasukkan pasangan *key* dan *pair* pada dictionary `g_data` untuk menyimpan data *health*, kemudian dilakukan save. Selanjutnya, file dibuka (baru dibua atau belum) dengan metode *read* supaya bisa terbaca dan diambil variabelnya dengan `file.get_var()`. Lalu, di close.<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/0565badd-a63a-4032-8f19-5d9bb31b3fe4)

    Masuk ke Project > Project Settings > AutoLoad dan masukkan file script tadi ke dalam AutoLoad. Hal ini supaya script otomatis dijalankan untuk semua scene pada saat scene dijalankan.
    ![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/37506aeb-d2ce-4728-894d-d5858de8b6b7)<br></br>

    Pada script yang mengatur perpindahan ke Level selanjutnya, dilakukan `save_data()` terhadap variabel *health* dalam scene `Level1`. Hal ini dilakukan supaya variabel tersimpan dan dapat dibaca pada scene selanjutnya (`Level2`).<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/7c70cf60-0ab3-4fa3-a4c2-9b8d1c523f57)<br></br>

    Oleh karena sudah dimasukkan ke AutoLoad, SaveFile dapat langsung dipanggil pada script `Player.gd`. Lalu, akan diambil `g_data` yang sudah menyimpan nilai *health* dari scene sebelumnya. Kemudian, masuk ke fungsi `_ready()` yang dijalankan pada saat scene dinyalakan, apabila player pada scene `Level2`, maka variabel *health* akan diganti dengan yang ada pada `g_data`. Sebagai *finishing*, jika nyawa pemain sudah berkurang, maka texture dari sprite akan diubah menjadi `hudHeart_half.png`.<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-4-gamedev-csui/assets/101686378/2c6eb88c-80eb-4f01-9d7d-ab9f793004ba)

#### Referensi
https://www.youtube.com/watch?v=Gcw_BYFmcQk&t=865s (Save System)






