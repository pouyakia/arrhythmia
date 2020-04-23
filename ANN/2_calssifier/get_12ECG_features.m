 function features = get_12ECG_features(data,header_data)
 
%  input_file = fullfile('E:\mit-bih-arrhythmia-database-1.0.0\data_2020\Training_WFDB\input', header_data);
% 	        fid=fopen(input_file);
% 	        tline = fgetl(fid);
        	tlines = cell(0,1);
% 
%  		while ischar(header_data)
%         	    tlines{end+1,1} = tline;
% 	            tline = fgetl(fid);
            for i=1:length(header_data)
			if startsWith(header_data{i},'#Age')
				tmp = strsplit(header_data{i},': ');
				tmp_c= strsplit(tmp{2},',');
                  age=str2num(tmp_c{1});
                 
 
            end
       
            end
        new_lable=[];
new_age=[];

    Qrs_amp_raw=[];
    q_amp_raw=[];
    s_amp_raw=[];
    rr_int=[];
    rs_int=[];
    qr_int=[];
    qrs_int=[];

    

    ecg_12=data;
    ecg=ecg_12(2,:);
    [qrs_amp_raw,qrs_i_raw,Q_amp_raw,Q_i_raw,S_amp_raw,S_i_raw,delay,RR_int,RS_int,QR_int,QRS_int]=pan_tompkin(ecg,500,0);
   
    a=age;
    b=max(size(qrs_amp_raw));
    new_age=zeros(1,b)+a;
    
%     
%     Qrs_amp_raw=[Qrs_amp_raw;qrs_amp_raw'];
%     q_amp_raw=[q_amp_raw;Q_amp_raw'];
%     s_amp_raw=[s_amp_raw;S_amp_raw'];
%     rr_int=[rr_int;RR_int'];
%     rs_int=[rs_int;RS_int'];
%     qr_int=[qr_int;QR_int'];
%     qrs_int=[qrs_int;QRS_int'];
    
    features=[RR_int;RS_int;Q_amp_raw;QR_int;qrs_amp_raw;QRS_int;S_amp_raw;new_age];
    
end
        

 
 
 

%        % addfunction path needed
%         addpath(genpath('Tools/'))
%         load('HRVparams_12ECG','HRVparams')
% 
% 	% read number of leads, sample frequency and gain from the header.	
% 
% 	[recording,Total_time,num_leads,Fs,gain,age,sex]=extract_data_from_header(header_data);
% 
% 	HRVparams.Fs=Fs;
%         HRVparams.PeakDetect.windows = floor(Total_time-1);
%         HRVparams.windowlength = floor(Total_time);
% 
% 	try
% 
%                 for i =1:num_leads
%                         Lead12wGain(i,:) = data(i,:)* gain(i);
%                 end
% 
% 
%                 % median filter to remove bw
%                 for i=1:num_leads
%                         ECG12filt(i,:) = medianfilter(Lead12wGain(i,:)', Fs);
%                 end
% 
%                 % convert 12Leads to XYZ leads using Kors transformation
%                 XYZLeads = Kors_git(ECG12filt);
% 
%                 VecMag = vecnorm(XYZLeads');
% 
% 
%                 % Convert ECG waveform in rr intervals
%                 [t, rr, jqrs_ann, SQIvalue , tSQI] = ConvertRawDataToRRIntervals(VecMag, HRVparams, recording);
%                 sqi = [tSQI', SQIvalue'];
% 
%                 % Find fiducial points using ECGKit
%                 ECG_header.nsig = 1; ECG_header.freq = Fs; ECG_header.nsamp = length(VecMag);
%                 wavedet_config.setup.wavedet.QRS_detection_only = 0;
%                 [Fid_pts,~,~] = wavedet_3D_ECGKit(VecMag', jqrs_ann', ECG_header, wavedet_config);
% 
%                 [XYZ_Median,Fid_pts_Median] = Time_coherent_code_github(XYZLeads,Fid_pts,Fs);
% 
%                 GEH_features = GEH_analysis_git(XYZ_Median,Fid_pts_Median,Fs);
% 
%                 features(1)=age;
%                 features(2)=sex;
%                 features(3:24)=GEH_features;
% 
% 
% 	catch
% 		features = NaN(1,24);
% 	end
% 
% end

