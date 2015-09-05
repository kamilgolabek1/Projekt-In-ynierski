<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Comments;

/**
 * CommentsSearch represents the model behind the search form about `backend\models\Comments`.
 */
class CommentsSearch extends Comments
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ID', 'LocationID', 'UserID'], 'integer'],
            [['Comment', 'Data'], 'safe'],
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
        $query = Comments::find();

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
            'LocationID' => $this->LocationID,
            'UserID' => $this->UserID,
            'Data' => $this->Data,
        ]);

        $query->andFilterWhere(['like', 'Comment', $this->Comment]);

        return $dataProvider;
    }
}
