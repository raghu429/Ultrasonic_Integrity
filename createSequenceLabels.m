function [sequence_labels_train,sequence_labels_test] = createSequenceLabels(Nwin,trainLabels,testLabels)
%A = [1 2 3; 4 5 6]
n = Nwin; % Number of repeated values --> 60 for your case
A = trainLabels;
for k = 1:size(A,1)
    sequence_labels_train(n*k-(n-1) : n*k, :) = repmat(A(k,:),n,1);
end

B = testLabels;
for k = 1:size(B,1)
    sequence_labels_test(n*k-(n-1) : n*k, :) = repmat(B(k,:),n,1);
end

end


% for k = 1:size(B,2)
%     sequence_labels_test(:,n*k-(n-1) : n*k) = repmat(B(:,k),1,n);
% end
