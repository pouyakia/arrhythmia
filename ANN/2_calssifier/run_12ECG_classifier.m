function [score, label] = run_12ECG_classifier(data,header_data,classes, model)

    num_classes = length(classes);

    label = zeros([1,num_classes]);
    score = zeros([1,num_classes]);
    
    % Use your classifier here to obtain a label and score for each class.
    features=get_12ECG_features(data,header_data);
    a=size(features);
    if a(1)==8
    output=model(features);
    output(find(output>9))=4;
    output(find(output<1))=1;
    l=length(output);
    r=round(output);
    if  ~isnan(r(1))
    score(r(1))=length(find(r==r(1)))/l;
    end
    for i=2:l
        if  ~isnan(r(i))
       score(r(i))=length(find(r==r(i)))/l;    
        end
    end
    
    [~,idx] = max (score);

    label(idx)=1;
    end
end