<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Topics;

/**
 * TopicsSearech represents the model behind the search form about `common\models\Topics`.
 */
class TopicsSearech extends Topics
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ID', 'categoryID', 'userID'], 'integer'],
            [['subject', 'date', 'tag'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Topics::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'ID' => $this->ID,
            'date' => $this->date,
            'categoryID' => $this->categoryID,
            'userID' => $this->userID,
        ]);

        $query->andFilterWhere(['like', 'subject', $this->subject])
            ->andFilterWhere(['like', 'tag', $this->tag]);

        return $dataProvider;
    }
}
