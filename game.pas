program game;
uses crt;
label
    ulang_nama, awal, akhir;
var
    nama : string[10];
    weapon,cloth,musuh : string;
    x,weapon_id,cloth_id,musuh_id,step,turn : integer;
    att,hp,mus_hp,mus_att,def,mus_def : real;
    ya : char;
    masih,battle : boolean;
    acak : integer; {Nilai random dari index 0 - n}
    batran,batran2 : real; {Angka acak digunakan untuk persen agar pertarungan makin seru (batran = battle random)}
begin
    Randomize;
    clrscr;
    hp := 100;
    weapon_id := 1;
    weapon := 'Punch';
    cloth_id := 1;
    cloth := 'T-shirt';
    att := 2.1;
    def := 1;
    step := 0;
    masih := true;


    writeln('Selamat Datang di Game JourneBoyz');
    ulang_nama: {Ulangi kode ini jika namanya kosong}
    writeln('Sebelum memulai, beri nama karaktermu (max 10)');
    readln(nama);
    if nama = '' then
        writeln('Harap jangan kosongkan nama');
        writeln;
        goto ulang_nama;

    clrscr;
    writeln('Halo ', nama, ', sekarang kamu ada di dunia Jouphoria.');
    writeln('Apakah kamu siap menjelajahinya? [y/n]');
    readln(ya);
    if ya = 'y' then
    begin
        writeln('Sebelum mulai berpetualang, sebaiknya kamu tahu statusmu dahulu');
        writeln;
        writeln('========== STATUS ==========');
        writeln('   Health : ', hp:0:0);
        writeln('   Weapon : ', weapon);
        writeln('   Attack : ', att:0:0);
        writeln('   Armor  : ', cloth);
        writeln('   Defense: ', def:0:0);
        writeln('   Step   : ', step);
        writeln('============================');
        writeln; writeln;
        writeln('Kamu bisa cek statusmu kapan saja dengan keyword 9');
        delay(1000);
        write('Harap tunggu'); delay(500);
        write('.'); delay(1000);
        write('.'); delay(500);
        write('.'); delay(500);
        write('.'); delay(2000);

        clrscr;
        while(masih) do
        begin
            awal:

            {baris kode declaration WEAPON}
            case weapon_id of
                1: begin
                    weapon := 'Punch';
                    att := 3.1;
                end;
                2: begin
                    weapon := 'Stick';
                    att := 3.8;
                end;
                3: begin
                    weapon := 'Steel';
                    att := 4.5;
                end;
            end;

            {Baris kode declaration ARMOR}
            case cloth_id of
                1: begin
                    cloth := 'T-shirt';
                    def := 1.0;
                end;
                2: begin
                    cloth := 'Light Armor';
                    def := 1.4;
                end;
                3: begin
                    cloth := 'Warrior Armor';
                    def := 1.8;
                end;
                4: begin
                    cloth := 'Knight Armor';
                    def := 2.2;
                end;
                5: begin
                    cloth := 'Desert Armor';
                    def := 2.5;
                end;
                6: begin
                    cloth := 'Riot Armor';
                    def := 2.9;
                end;
                7: begin
                    cloth := 'Cyborg Armor';
                    def := 3.4;
                end;
            end;

            if hp > 100 then hp := 100; {Health tidak boleh > 100}

            write('Maju berapa langkah? (max 3) : ');
            readln(x);
            if (x <= 3) AND (x > 0) then
                begin
                writeln('Maju ', x, ' langkah');
                step := step + x;
                end
            else if x < 0 then
                writeln('Tidak bisa kurang dari 0')
            else if x = 0 then
                begin
                writeln('Sayang sekali, sebenarnya perjalanan masih sangat panjang.');
                writeln('Sampai jumpa lagi ', nama);
                masih := false;
                writeln('=========== OVER ===========');
                writeln('   Health   : ', hp:0:0);
                writeln('   Weapon   : ', weapon);
                writeln('   Attack   : ', att:0:1);
                writeln('   Armor    : ', cloth);
                writeln('   Defense  : ', def:0:1);
                writeln('   Step     : ', step);
                writeln('============================');
                writeln;
                goto akhir;
                end
            else if x = 9 then
                begin
                clrscr;
                writeln('========== STATUS ==========');
                writeln('   Health   : ', hp:0:0);
                writeln('   Weapon   : ', weapon);
                writeln('   Attack   : ', att:0:1);
                writeln('   Armor    : ', cloth);
                writeln('   Defense  : ', def:0:1);
                writeln('   Step     : ', step);
                writeln('============================');
                writeln;
                goto awal;
                end
            else
                begin
                writeln('Hanya bisa max 3 langkah');
                delay(1000);
                writeln('Maju 3 langkah');
                step := step + 3;
            end;

            delay(1500);
            clrscr;

            acak := random(1000);
            writeln('Angka acak : ', acak);

            if acak < 10 then
                begin
                writeln('Kamu terkena serangan tak dikenal dan darahmu berkurang 15');
                hp := hp - 15;
                end
            else if acak < 30 then
                begin
                writeln('========== SELAMAT ==========');
                writeln;
                writeln(' Kamu mendapat senjata Steel ');
                writeln('     Attack point : 4.5      ');
                writeln;
                writeln('=============================');
                writeln;

                writeln('Apakah ingin kamu ambil? [y/n]');
                readln(ya);
                if ya = 'y' then weapon_id := 3;
            end

            else if acak < 80 then
                begin
                writeln('========== SELAMAT ==========');
                writeln;
                writeln('   Kamu menemukan kotak P3K  ');
                writeln('     HP mu bertambah 15      ');
                writeln;
                writeln('=============================');
                hp := hp + 15;
            end

            else if acak < 100 then
                begin
                writeln('========== SELAMAT ==========');
                writeln;
                writeln('  Kamu mendapat Cyborg Armor ');
                writeln('      DEF mu menjadi 3.4     ');
                writeln;
                writeln('=============================');
                writeln;
                write('Apakah ingin diambil? [y/n]  ');
                readln(ya);
                if ya = 'y'then cloth_id := 7;
            end

            else if acak < 130 then
                begin
                writeln('========== SELAMAT ==========');
                writeln;
                writeln(' Kamu mendapat senjata Stick ');
                writeln('     Attack point : 3.8      ');
                writeln;
                writeln('=============================');
                writeln;

                writeln('Apakah ingin kamu ambil? [y/n]');
                readln(ya);
                if ya = 'y' then weapon_id := 2;
            end

            else if acak < 150 then
                begin
                writeln('========== SELAMAT ==========');
                writeln;
                writeln('  Kamu mendapat Light Armor  ');
                writeln('       Def point = 1.4       ');
                writeln;
                writeln('=============================');
                writeln;
                write('Apakah ingin diambil? [y/n]  ');
                readln(ya);
                if ya = 'y' then cloth_id := 2;
            end

            else if acak < 100 then
                begin
                writeln('========== SELAMAT ==========');
                writeln;
                writeln('  Kamu mendapat Knight Armor ');
                writeln('       Def point = 2.2       ');
                writeln;
                writeln('=============================');
                writeln;
                write('Apakah ingin diambil? [y/n]  ');
                readln(ya);
                if ya = 'y' then cloth_id := 4;
            end

            else if acak < 550 then
                begin
                musuh_id := random(10);
                case musuh_id of
                    1,2,3,4: begin
                        musuh := 'Evil Gnome';
                        mus_hp := 10;
                        mus_att := 3.2;
                        mus_def := 1.2;
                    end;
                    5,6: begin
                        musuh := 'Mad Cockroach';
                        mus_hp := 7;
                        mus_att := 3.4;
                        mus_def := 1.4;
                    end;
                    7: begin
                        musuh := 'Mad Frog';
                        mus_hp := 12;
                        mus_att := 3.6;
                        mus_def := 1.5;
                    end;
                    8: begin
                        musuh := 'Mad Elf';
                        mus_hp := 15;
                        mus_att := 4.0;
                        mus_def := 1.2;
                    end;
                    9: begin
                        musuh := 'Flock of Insects';
                        mus_hp := 12;
                        mus_att := 4.1;
                        mus_def := 1.2;
                    end;
                    10: begin
                        musuh := 'Flock of Crazy Frogs';
                        mus_hp := 15;
                        mus_att := 4.2;
                        mus_def := 1.7;
                    end;
                end;

                writeln('========== AWAS ==========');
                writeln;
                writeln('Di depanmu ada ', musuh);
                writeln;
                writeln('==========================');
                write('Apakah ingin menyerang? [y/n]  ');
                readln(ya);
                if(ya = 'y') then
                    begin
                    turn := 0;
                    writeln('Pertarungan segera dimulai');
                    write('.'); delay(500);
                    write('.'); delay(500);
                    write('.'); delay(500);
                    writeln;

                    {Pertarungan}

                    while((hp >= 0) OR (mus_hp >= 0)) do {Anda mati belum dikasih}
                        begin
                        turn := turn + 1;
                        batran := random(); {range batran antara 0 - 1}
                        batran := (mus_att - def)*batran;
                        batran2 := random();
                        batran2 := (att - mus_def)*batran2;
                        hp := hp - batran;
                        mus_hp := mus_hp - batran2;

                        writeln;
                        writeln('============ ', turn, ' ==========');
                        writeln(nama, ' terkena ', batran:0:0, ' serangan');
                        writeln(musuh, ' terkena ', batran2:0:0, ' serangan');
                        writeln('========================');
                        writeln;

                        delay(1500);

                        if hp < 0 then
                            begin
                            writeln('Total serangan : ', turn);
                            writeln('Anda mati dalam pertarungan dengan ', musuh);
                            goto akhir;
                        end
                        else if mus_hp < 0 then
                            begin
                            writeln('Total serangan : ', turn);
                            writeln('Selamat! Anda menang dalam pertarungan melawan ', musuh);
                            goto awal;
                        end;
                    end;
                end
                else
                    goto awal;
            end {Akhir kondisi acak < 200}

            else writeln('Perjalananmu sangat lancar');

            akhir: {Langsung menuju ke akhir}
        end;
    end

    else
        writeln('Baiklah ', nama, ', mungkin lain kali.');

    readln;
end.