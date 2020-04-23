function model = load_12ECG_model()

        filename='net.mat';
        A=load(filename);
        model=A.net;

end


