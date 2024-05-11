

clc
% Demander à l'utilisateur le nombre de variables
nbVariables = input('Entrez le nombre de boule : ');

% Demander à l'utilisateur d'entrer les valeurs des 8 variables
valeurs = zeros(1, nbVariables);
for i = 1:nbVariables
    valeurs(i) = input(['Entrez la valeur de la boule ', num2str(i), ' : ']);
end

% Initialiser le choix de l'utilisateur
choix = 0;
options = [1, 2, 3, 4, 5];  % Options disponibles (ajout de l'option 5 pour le graphe)

% Boucle pour permettre à l'utilisateur de choisir des options
while choix ~= 5
    disp('Choisissez une option :');
    disp('1. Afficher la fonction de masse');
    disp('2. Afficher la fonction de répartition');
    disp('3. Calculer la moyenne (espérance)');   
    disp('4. Tracer la courbe (graphe)');  % Nouvelle option
     disp('5. Quitter');
    choix = input('Tapez 1, 2, 3, 4 ou 5 : ');

    % Vérifier si l'option est valide
    if ~ismember(choix, options)
        disp('Option invalide. Veuillez choisir 1, 2, 3, 4 ou 5.');
        continue;  % Recommencer la boucle
    end

    % Retirer l'option choisie des options disponibles
    options(options == choix) = [];

    % Calculer la fonction de masse
    probabilites = ones(1, nbVariables) / nbVariables;

    % Calculer la fonction de répartition
    fonctionRepartition = cumsum(probabilites);

    % Calculer l'espérance  
    esperance = sum(valeurs .* probabilites);

    % Afficher les résultats en fonction du choix de l'utilisateur
    if choix == 1
        disp('Fonction de masse :');
        disp(probabilites);
    elseif choix == 2
        disp('Fonction de répartition :');
        disp(fonctionRepartition);
    elseif choix == 3
        disp(['Espérance : ', num2str(esperance)]);
  elseif choix == 4
    % Tracer la courbe (graphe) avec la fonction de masse, la fonction de répartition et la moyenne
    figure;
    
    % Tracer la fonction de masse
    subplot(3, 1, 1);
    bar(1:nbVariables, probabilites);
    xlabel('Variable');
    ylabel('Probabilité');
    title('Fonction de masse');

    % Tracer la fonction de répartition
    subplot(3, 1, 2);
    stairs(1:nbVariables, fonctionRepartition);
    xlabel('Variable');
    ylabel('Probabilité cumulée');
    title('Fonction de répartition');

    % Tracer la moyenne
    subplot(3, 1, 3);
    plot(1:nbVariables, valeurs, 'o-', 'MarkerFaceColor', 'b');
    hold on;
    line([1, nbVariables], [esperance, esperance], 'Color', 'r', 'LineStyle', '--');
    xlabel('Variable');
    ylabel('Valeur');
    title('Courbe des valeurs avec la moyenne');
    legend('Valeurs', ['Moyenne: ', sprintf('%.3f', esperance)], 'Location', 'best');
    grid on;
    
    hold off;


    elseif choix == 5
        disp('Merci d''avoir utilisé ce programme. Au revoir !');
    end
end

